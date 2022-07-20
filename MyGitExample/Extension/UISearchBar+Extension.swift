//
//  UISearchBar+Extension.swift
//  MyGitExample
//
//  Created by bro on 2022/06/28.
//

import UIKit

extension UISearchBar {
    var textField : UITextField? {
        if #available(iOS 13.0, *) {
            return self.searchTextField
        } else {
            // Fallback on earlier versions
            return value(forKey: "_searchField") as? UITextField // value속성은 object c 속성이다. 찾아보기
        }
    }
}
