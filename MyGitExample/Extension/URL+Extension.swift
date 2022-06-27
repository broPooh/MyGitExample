//
//  URL+Extension.swift
//  MyGitExample
//
//  Created by bro on 2022/06/26.
//

import Foundation

extension URL {
    
    static let gitBaseURL = "https://api.github.com/"
    //https://api.github.com/search/users?q=yoon in:name&type:user

    static func makeEndPointString(_ endpoint: String) -> String {
        return gitBaseURL + endpoint
    }
}

