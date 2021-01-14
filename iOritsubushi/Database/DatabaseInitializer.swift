//
//  DatabaseInitializer.swift
//  iOritsubushi
//
//  Created by yonezawaizumi on 2021/01/03.
//

import Foundation
import RxSwift
import RxGRDB

struct DatabaseInitializer {
    
    func getOlderWritablePath() -> String {
        return NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0]
    }
    
    func getWritablePath(databaseFileName: String) -> URL {
        return FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: Constants.dataGroupName)!.appendingPathComponent(databaseFileName)
    }

    func prepareDatabase(name: String, databasePath: String, userVersion: Int) -> Single<Bool> {
        return Single<Bool>.create { observer in
            let manager = FileManager.default
            if manager.fileExists(atPath: databasePath) {
                if userVersion == 0 {
                    observer(.success(true))
                    return Disposables.create()
                }
                let queue = DatabaseQueue(path: databasePath)
            }
        }
    }
}
