//
//  ViewModelType.swift
//  MyGitExample
//
//  Created by bro on 2022/06/28.
//

import Foundation

protocol ViewModelType: AnyObject {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
