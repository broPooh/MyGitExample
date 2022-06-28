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
    
    func transform(input: Input) -> Output {
        return MainViewModel.Output()
    }
    
}
