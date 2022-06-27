//
//  APIEnums.swift
//  MyGitExample
//
//  Created by bro on 2022/06/26.
//

import Foundation


//-H "Accept: application/vnd.github.v3+json" \
//-H "Authorization: token <TOKEN>" \
enum NetworkHeader: String {
    case accept = "Accept"
    case authorization = "Authorization"
}

enum NetworkHeaderField {
    case gitAuthorization
    case accept
    
    var field: String {
        switch self {
        case .gitAuthorization: return "token \(Config.githupToken)"
        case .accept: return "application/vnd.github.v3+json"
        }
    }
}

enum GitHubStatusCode: Int {
    case ok = 200
}

enum GitHupAPISearchError: Int, Error {

    case notModified = 304
    case notFound = 404
    case validationFailed = 422
    case unavailable = 503
    case unknown
    case failed
    case invalidResponse
    case noData
    case invalidData


    var description: String { self.errorDescription }
}

extension GitHupAPISearchError {

    var errorDescription: String {
        switch self {
        case .notModified: return "304: Not Modified"
        case .notFound: return "404: Not Found"
        case .validationFailed: return "422: Validation Failed"
        case .unavailable: return "503: Unavailable"
        case .failed: return "네트워크통신 실패"
        case .invalidData: return "시리얼라이즈 실패"
        default: return "UN_KNOWN_ERROR"
        }
    }
}

