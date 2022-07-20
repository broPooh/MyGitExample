//
//  RealmModel.swift
//  MyGitExample
//
//  Created by bro on 2022/06/29.
//

import Foundation
import RealmSwift

class GitItem: Object {
    @Persisted var id: Int
    @Persisted var login: String
    @Persisted var avatarURL: String
    @Persisted var url: String
    @Persisted var createAt: Date
    @Persisted var favorite: Bool
    
    
    convenience init(id: Int, login: String, avatarURL: String, url: String, createAt: Date, favorite: Bool) {
        self.init()
        
        self.id = id
        self.login = login
        self.avatarURL = avatarURL
        self.url = url
        self.createAt = createAt
        self.favorite = favorite
    }
    
}
    
