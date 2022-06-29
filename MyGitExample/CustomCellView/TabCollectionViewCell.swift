//
//  TabCollectionViewCell.swift
//  MyGitExample
//
//  Created by bro on 2022/06/28.
//

import UIKit

import Then
import SnapKit

final class TabCollectionViewCell: UICollectionViewCell {
        
    let titleLabel = UILabel().then {
        $0.text = "Tab"
        $0.textAlignment = .center
        //$0.textColor = isSelected ? .toolbarActiveColor : .toolbarinActiveColor
        $0.font = .tabTitle
    }
    
    override var isSelected: Bool {
        didSet {
            self.titleLabel.textColor = isSelected ? .toolbarActiveColor : .toolbarinActiveColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        setupConstraints()
        labelConfig()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    
    func labelConfig() {
        titleLabel.textColor = isSelected ? .toolbarActiveColor : .toolbarinActiveColor
    }
    
    func configure(title: String) {
        titleLabel.text = title
    }
}
