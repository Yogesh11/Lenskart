//
//  Movie.swift
//  Code
//
//  Created by Yogesh2 Gupta on 13/02/22.
//

import UIKit

struct Movie: Codable {
    let overview : String?
    let title : String?
    let original_title : String?
    let id  : Int
    let vote_count  :Int?
    let popularity : Double?
    let release_date  : String
    
    func addedToWatchList()-> Bool {
        PersistentStore.shared.addedToWatchlist(movieId: id)
    }
    
    func addToWatchList() {
        PersistentStore.shared.addToWatchlist(movieId: id)
    }
    
    func removeFromWatchList() {
        PersistentStore.shared.removeFromWatchList(movieId: id)
    }
}
