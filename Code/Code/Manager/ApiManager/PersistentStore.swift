//
//  PersistentStore.swift
//  Code
//
//  Created by Yogesh2 Gupta on 13/02/22.
//

import UIKit

class PersistentStore: NSObject {
    static let shared = PersistentStore()
    private override init() {
        super.init()
    }
    func addedToWatchlist(movieId : Int)->Bool{
        UserDefaults.standard.bool(forKey: String(movieId))
    }
    
    func addToWatchlist(movieId : Int){
        UserDefaults.standard.set(true, forKey: String(movieId))
    }
    
    func removeFromWatchList(movieId : Int){
        UserDefaults.standard.set(false, forKey: String(movieId))
    }
}
