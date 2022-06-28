//
//  UICollectionViewCell+Extension.swift
//  MyGitExample
//
//  Created by bro on 2022/06/28.
//

import UIKit

extension UICollectionViewCell: Reusable {
   static var reuseIdentifier: String {
        return String(describing: self)
    }
}
