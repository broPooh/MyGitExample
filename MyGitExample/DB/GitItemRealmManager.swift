//
//  GitItemRealmManager.swift
//  MyGitExample
//
//  Created by bro on 2022/06/29.
//

import Foundation

import RealmSwift

final class GitItemRealmManager {
    
    
    
    static let shared = GitItemRealmManager()
    private init() { }

    func loadDatas() -> Results<GitItem> {
        let localRealm = try! Realm()
        return localRealm.objects(GitItem.self).sorted(byKeyPath: "createAt", ascending: false)
    }
    
    func saveData(data: GitItem) {
        let localRealm = try! Realm()
        do {
            try localRealm.write {
                localRealm.add(data)
            }
        } catch {
            print("Error save : \(error)")
        }
    }
    
    func deleteData(data: GitItem) {
        let localRealm = try! Realm()
        do {
            try localRealm.write {
                localRealm.delete(data)
            }
        } catch {
            print("Error Delete : \(error)")
        }
    }
    
    func updateData(data: GitItem) {
        let localRealm = try! Realm()
        do {
            try localRealm.write {
                localRealm.add(data)
            }
        } catch {
            print("Error save : \(error)")
        }
    }
    
    func saveCheck(id: Int) -> Bool {
        let localRealm = try! Realm()
        guard let _ = localRealm.objects(GitItem.self).where({ $0.id == id && $0.favorite == true }).first else {
            return false
        }
        return true
    }
    
    func loadData(id: Int)  -> GitItem? {
        let localRealm = try! Realm()
        return localRealm.objects(GitItem.self).where({ $0.id == id}).first
    }
    
}
