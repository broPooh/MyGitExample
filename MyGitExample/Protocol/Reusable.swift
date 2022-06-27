//
//  Reusable.swift
//  MyGitExample
//
//  Created by bro on 2022/06/26.
//

import Foundation

protocol Reusable {
    static var reuseIdentifier: String {
        get
    }
}

protocol ViewRepresentable {
    func setupView()
    func setupConstraints()
}
