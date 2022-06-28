//
//  UIImageView+Extension.swift
//  MyGitExample
//
//  Created by bro on 2022/06/26.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(imageUrl: String) {
        self.kf.setImage(
            with: URL(string: imageUrl),
            placeholder: UIImage(systemName: SystemImage.icSearchNonW.rawValue)
        )
    }
}
