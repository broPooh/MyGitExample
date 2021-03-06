//
//  SearchEnum.swift
//  MyGitExample
//
//  Created by bro on 2022/06/27.
//

import Foundation

enum SearchDelayType {
    case auto
    case normal
}

enum SearchType {
    case search
    case fetch
}

enum SearchQuery: Int {
    static let nextPage = 1
    static let queryDelay = 1

    case startPage = 1
    case size = 30
}
