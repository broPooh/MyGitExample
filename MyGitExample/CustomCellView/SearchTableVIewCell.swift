//
//  SearchTableVIewCell.swift
//  MyGitExample
//
//  Created by bro on 2022/06/26.
//

import UIKit

import Then
import SnapKit

final class SearchTableVIewCell: UITableViewCell, ViewRepresentable {
   
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
        $0.setImage(UIImage(named: SystemImage.icSearchNonW.rawValue), for: .normal)
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
        
    }
    
}
