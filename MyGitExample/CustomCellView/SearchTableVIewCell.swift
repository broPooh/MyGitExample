//
//  SearchTableVIewCell.swift
//  MyGitExample
//
//  Created by bro on 2022/06/26.
//

import UIKit

import Then
import SnapKit

final class SearchTableViewCell: UITableViewCell, ViewRepresentable {
    
    var favoriteButtonAction: ( () -> () )?
   
    let userImageView = UIImageView().then {
        $0.layer.cornerRadius = $0.bounds.width / 2
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.clear.cgColor
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
    }
    
    let nameLabel = UILabel().then {
        $0.textColor = .lableColor
        $0.textAlignment = .center
        $0.font = .titleBold
    }
    
    let favoriteButton = UIButton().then {
        $0.tintColor = .buttonImageColor
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
        buttonConfig()
        imageViewConfig()
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(userImageView)
        addSubview(favoriteButton)
        addSubview(nameLabel)
    }
    
    func setupConstraints() {
        
        userImageView.snp.makeConstraints {
//            $0.top.equalToSuperview().offset(10)
//            $0.bottom.equalToSuperview().offset(-10)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(50)
            $0.height.equalTo(50)
        }
        
        favoriteButton.snp.makeConstraints {
//            $0.top.equalTo(userImageView.snp.top)
//            $0.bottom.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-20)
            $0.width.equalTo(50)
            $0.height.equalTo(50)
            
        }
        
        nameLabel.snp.makeConstraints {
//            $0.top.equalTo(userImageView.snp.top)
//            $0.bottom.equalTo(userImageView.snp.bottom)
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(userImageView.snp.trailing).offset(10)
            $0.trailing.equalTo(favoriteButton.snp.leading).offset(-10)
        }
        
        nameLabel.backgroundColor = .blue
    }
    
    func buttonConfig() {
        favoriteButton.setImage(UIImage(systemName: SystemImage.star.rawValue), for: .normal)
        favoriteButton.imageView?.contentMode = .scaleAspectFit
        favoriteButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        favoriteButton.addTarget(self, action: #selector(favoriteButtonClicked), for: .touchUpInside)
    }
    
    @objc func favoriteButtonClicked() {
        print(#function)
        favoriteButtonAction?()
    }
    
    func imageViewConfig() {
        userImageView.layer.cornerRadius = userImageView.bounds.width / 2
        userImageView.layer.borderWidth = 1
        userImageView.layer.borderColor = UIColor.clear.cgColor
        userImageView.clipsToBounds = true
    }
    
    func configure(item: Item) {
        userImageView.setImage(imageUrl: item.avatarURL)
        nameLabel.text = item.login
        
        let image = GitItemRealmManager.shared.saveCheck(id: item.id) ? UIImage(systemName: SystemImage.fillStar.rawValue) : UIImage(systemName: SystemImage.star.rawValue)
        favoriteButton.setImage(image, for: .normal)
    }
    
}
