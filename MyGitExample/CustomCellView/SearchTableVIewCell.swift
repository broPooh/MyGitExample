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
   
    let userImageView = UIImageView().then {
        $0.layer.cornerRadius = $0.bounds.width / 2
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.clear.cgColor
        $0.clipsToBounds = true
    }
    
    let nameLabel = UILabel().then {
        $0.textColor = .lableColor
        $0.textAlignment = .center
        $0.font = .titleBold
    }
    
    let favoriteButton = UIButton().then {
        $0.setImage(UIImage(named: SystemImage.fillStar.rawValue), for: .normal)
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(userImageView)
        addSubview(nameLabel)
        addSubview(favoriteButton)
    }
    
    func setupConstraints() {
        
        userImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(10)
            $0.bottom.equalToSuperview().offset(-10)
            $0.width.equalTo(50)
            $0.height.equalTo(50)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(userImageView.snp.top)
            $0.leading.equalTo(userImageView.snp.trailing).offset(10).priority(.low)
            $0.bottom.equalTo(userImageView.snp.bottom)
            $0.trailing.equalTo(favoriteButton.snp.leading).offset(-10)
        }
        
        favoriteButton.snp.makeConstraints {
            $0.top.equalTo(userImageView.snp.top)
            $0.leading.equalTo(nameLabel.snp.trailing).offset(10)
            $0.trailing.equalToSuperview().offset(-10)
            $0.bottom.equalTo(userImageView.snp.bottom)
            $0.width.equalTo(50)
            $0.height.equalTo(50)
        }
    }
    
    func configure(item: Item) {
        userImageView.setImage(imageUrl: item.avatarURL)
        nameLabel.text = item.login
    }
    
}
