//
//  MainViewModel.swift
//  MyGitExample
//
//  Created by bro on 2022/06/28.
//

import Foundation

final class MainViewModel: ViewModelType {
    
    struct Input {
        var query: Observable<String>
        var currentPage: Int = 1
        var isLoading: Observable<Bool> = Observable(false)
    }
    
    struct Output {
        var gitHubResponse: Observable<GitHubResponse> = Observable(GitHubResponse(totalCount: 0, incompleteResults: false, items: []))
    }
    
    var query: String = ""
    var currentPage: Int = 1
    var isLoading: Observable<Bool> = Observable(false)
    var searchType: SearchType = .search
    var gitHubResponse: Observable<GitHubResponse> = Observable(GitHubResponse(totalCount: 0, incompleteResults: false, items: []))
    
    
    func transform(input: Input) -> Output {
        //let value = input.query + "를 입력하셨습니다"
        return MainViewModel.Output()
    }
    
    func searchUsersDelegate(query: String, delegate: URLSessionDataDelegate, type: SearchType) {
        print("검색 호출")
        isLoading.value = true
        self.query = query
        self.searchType = type
        APIService.searchUsersDelegate(query: query, page: currentPage, delegate: delegate)
    }
    
    func searchUsers(query: String, delegate: URLSessionDataDelegate, type: SearchType) {
        isLoading.value = true
        APIService.searchUsers(query: query, page: currentPage) { result in
            switch result {
            case .success(let response):
                self.isLoading.value = false
                print(response)
            case .failure(let error): print(error.errorDescription)
            }
        }
    }

    
}
