//
//  UITableViewCell+Extension.swift
//  MyGitExample
//
//  Created by bro on 2022/06/27.
//

import UIKit

extension UITableViewCell: Reusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
