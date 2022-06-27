//
//  BaseUIView.swift
//  MyGitExample
//
//  Created by bro on 2022/06/26.
//

import UIKit
import SnapKit

class BaseUIView: UIView, ViewRepresentable {

    func setupView() { }

    func setupConstraints() { }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError()
    }
}

