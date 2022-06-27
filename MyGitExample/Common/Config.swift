//
//  Config.swift
//  MyGitExample
//
//  Created by bro on 2022/06/26.
//

import Foundation

struct Config {
    
    private init() { }
    
    enum PlistKeys: String {
        case githupToken = "GITHUB_KEY"
    }
    
    // MARK: - Plist
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dict
    }()
    
    
    static let githupToken: String = {
        guard let githupToken = Config.infoDictionary[PlistKeys.githupToken.rawValue] as? String else {
            fatalError("API Key not set in plist for this environment")
        }
        return githupToken
    }()
}
