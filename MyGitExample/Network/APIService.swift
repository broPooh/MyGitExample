//
//  APIService.swift
//  MyGitExample
//
//  Created by bro on 2022/06/27.
//

import Foundation

final class APIService {

    private init() { }
        
    static func searchUsers(query: String, page: Int, completion: @escaping (Result<GitHubResponse, GitHupAPISearchError>) -> Void) {
        
        guard let compoenet = makeURLComponents(url: Endpoint.searchUser.urlString, params: [
            "q": "\(query) in:name",
            "page" : "\(page)",
            "type" : "user"
        ]) else { return }
        let request = makeURLRequestFromComponent(component: compoenet, headers: [
                NetworkHeader.accept.rawValue : NetworkHeaderField.accept.field,
                NetworkHeader.authorization.rawValue : NetworkHeaderField.gitAuthorization.field,
        ])
        
        URLSession.requestResultType(endpoint: request, completion: completion)
    }
    
    static func searchUsersDelegate(query: String, page: Int, delegate: URLSessionDataDelegate) {
        //print("APIService 검색 호출")
        guard let compoenet = makeURLComponents(url: Endpoint.searchUser.urlString, params: [
            "q": "\(query) in:name",
            "page" : "\(page)",
            "type" : "user"
        ]) else { return }
        let request = makeURLRequestFromComponent(component: compoenet, headers: [
                NetworkHeader.accept.rawValue : NetworkHeaderField.accept.field,
                NetworkHeader.authorization.rawValue : NetworkHeaderField.gitAuthorization.field,
        ])
        URLSession.requestDelegate(URLSession(configuration: .default, delegate: delegate, delegateQueue: .main), endpoint: request)
    }
    
    static func searchUsersFromDelegate(query: String, page: Int, delegate: URLSessionDataDelegate, completion: @escaping (Result<GitHubResponse, GitHupAPISearchError>) -> Void) {
        guard let compoenet = makeURLComponents(url: Endpoint.searchUser.urlString, params: [
            "q": "\(query) in:name",
            "page" : "\(page)",
            "type" : "user"
        ]) else { return }
        let request = makeURLRequestFromComponent(component: compoenet, headers: [
                NetworkHeader.accept.rawValue : NetworkHeaderField.accept.field,
                NetworkHeader.authorization.rawValue : NetworkHeaderField.gitAuthorization.field,
        ])
        URLSession.requestDelegateHandler(URLSession(configuration: .default, delegate: delegate, delegateQueue: .main), endpoint: request, completion: completion)
    }
    
    
    static func makeURLComponents(url: String, params: [String: String]) -> URLComponents? {
        guard var component = URLComponents(string: url) else { return nil}
        component.queryItems = params.map { key, value in
            URLQueryItem(name: key, value: value)
        }
        return component
    }
    
    static func makeURLRequestFromComponent(component: URLComponents, method: HTTPMethod = .GET, headers: [String : String]) -> URLRequest {
        var request = URLRequest(url: component.url!)
        request.httpMethod = method.rawValue
        
        headers.forEach { (key, value) in
            request.addValue(value, forHTTPHeaderField: key)
            //request.setValue(key, forHTTPHeaderField: value)
        }
    
        return request
    }
    
}
