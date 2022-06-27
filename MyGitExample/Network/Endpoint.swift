//
//  Endpoint.swift
//  MyGitExample
//
//  Created by bro on 2022/06/27.
//

import Foundation

enum HTTPMethod: String {
    case GET
    case PUT
    case POST
    case DELETE
}

enum Endpoint {
    case searchUser
}

extension Endpoint {
    var urlString: String {
        switch self {
        case .searchUser: return URL.makeEndPointString("search/users")
        }
    }
}
