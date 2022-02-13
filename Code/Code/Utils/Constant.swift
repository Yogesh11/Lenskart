//
//  Constant.swift
//  Code
//
//  Created by Yogesh2 Gupta on 13/02/22.
//

import Foundation

struct Constant {
    struct Api {
        static let kEndPoint  = "https://api.themoviedb.org/3/search/movie?api_key=7e588fae3312be4835d4fcf73918a95f&query=a%20"
        static let kGetRequest = "GET"
    }
    
    struct Assets {
        static let addedToWatchList = "ic_wishlist_selected"
        static let defaultWatchList = "heartV2"
    }
    
    struct ViewIdentifier {
        static let landingCell = "LandingCell"
        static let detailCell = "DetailCell"
        static let detailController = "DetailController"
    }
    
    struct ViewTitle {
        static let landingPage = "Movies"
        static let detailPage = "Movie Detail"
    }
    
    struct DefaultText {
        static let popularity = "Popularity "
        static let releaseDate = "Release Date "
        static let vote = "Vote "
    }
    struct ErrorMessage {
        static let kGenricErrorTitle    = "Try again!"
        static let kGenericErrorMessage = "Something went wrong. Please try again."
        static let kGenericErrorCode    = "GEC0001"
    }

    typealias CompletionBlock        = (_ result: Any?   , _ error: LError?) -> Void
}

