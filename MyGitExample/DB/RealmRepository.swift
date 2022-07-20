//
//  RealmRepository.swift
//  MyGitExample
//
//  Created by bro on 2022/06/29.
//

import Foundation
import RealmSwift

protocol RealmRepository {
    
    associatedtype Data
    
    func loadDatas<Data>() -> Results<Data>
    func saveData<Data>(data: Data)
    func deleteData<Data>(data: Data)
    func updateData<Data>(data: Data)
    
}
