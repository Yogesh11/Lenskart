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
    var isAddedToWatchlist: Bool?
    
   mutating func addedToWatchList()-> Bool {
       if  isAddedToWatchlist  == nil{
         isAddedToWatchlist = PersistentStore.shared.addedToWatchlist(movieId: id)
       }
        return isAddedToWatchlist ?? false
    }
    
    mutating func addToWatchList() {
        isAddedToWatchlist = true
        PersistentStore.shared.addToWatchlist(movieId: id)
    }
    
    mutating func removeFromWatchList() {
         isAddedToWatchlist = false
        PersistentStore.shared.removeFromWatchList(movieId: id)
    }
}
