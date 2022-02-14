//
//  MovieCellViewModel.swift
//  Code
//
//  Created by Yogesh2 Gupta on 14/02/22.
//

import UIKit

class MovieCellViewModel: NSObject {
    private var movieObj : Movie?
    private override init() {
        super.init()
    }
    
    init?(movie : Movie?) {
        guard let validObj =  movie else {
            return nil
        }
        movieObj = validObj
    }
    
    func getMovieTitle()-> String?{
        movieObj?.title
    }
    
    func getPopularity() -> String?{
        if let val  = movieObj?.popularity,  val > 0 {
           return Constant.DefaultText.popularity  + String(val)
        }
        return nil
    }
    
    func getReleaseDate() -> String?{
        if let releaseDateTxt  = movieObj?.release_date,  !releaseDateTxt.isEmpty {
           return Constant.DefaultText.releaseDate  + releaseDateTxt
        }
        return nil
    }
    
    func getOverView()->  String?{
        movieObj?.overview
    }
    
    func getImage()->String{
        movieObj?.addedToWatchList() == true ? Constant.Assets.addedToWatchList : Constant.Assets.defaultWatchList
    }
    
    func getOriginalTitle()->String?{
        movieObj?.original_title
    }
    
    func getVoteCount()-> String{
        Constant.DefaultText.vote + String((movieObj?.vote_count ?? 0))
    }
    
    func ctaAddedToWatchListAction(){
        if movieObj?.addedToWatchList()  == true {
            movieObj?.removeFromWatchList()
        } else{
            movieObj?.addToWatchList()
        }
    }
}
