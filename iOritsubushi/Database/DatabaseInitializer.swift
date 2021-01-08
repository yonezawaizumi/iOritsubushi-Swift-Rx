//
//  DatabaseInitializer.swift
//  iOritsubushi
//
//  Created by yonezawaizumi on 2021/01/03.
//

import Foundation

struct DatabaseInitializer {
    
    func getOlderWritablePath() -> String {
        return NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0]
    }
    
    func getWritablePath(databaseFileName: String) -> URL {
        return FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: Constants.dataGroupName)!.appendingPathComponent(databaseFileName)
    }

    func prepareDatabase(name: String, databasePath: String, userVersion: Int) -> {
        return create { observer -> Disposable in {
            Observable<Bool> {
            let manager = FileManager.default
            if manager.fileExists(atPath: databasePath) {
                if userVersion == 0 {
                    observer.onNext(false).onComplete()
                    return NopDisposable.instance
                }
                let queue = DatabaseQueue(path: databasePath)
                
            }
            
        }
    }
}
