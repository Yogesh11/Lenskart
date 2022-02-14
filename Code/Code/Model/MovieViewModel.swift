//
//  MovieViewModel.swift
//  Code
//
//  Created by Yogesh2 Gupta on 13/02/22.
//

import UIKit

class MovieViewModel: NSObject {
    private var movies : Movies? = nil
    func getDataforPage(_ page : Int, completionBlock : @escaping Constant.CompletionBlock){
        ApiManager.sharedInstance.getDataForPage(page) {[weak self] result, error in
            if let obj = result as? Movies {
                if page ==  1  {
                    self?.movies?.results = obj.results
                    self?.movies = obj
                }else{
                    if let dta = obj.results, !dta.isEmpty {
                        self?.movies?.results?.append(contentsOf: dta)
                    }
                }
            }
            DispatchQueue.main.async {
              completionBlock(result, error)
            }
        }
    }
    
    func totalMovies()->Int{
        movies?.results?.count ?? 0
    }
    
    func getNextPage()->  Int {
        (movies?.page ?? 0) + 1
    }
    
    func getMovieByIndex(index  : Int) -> Movie?{
        movies?.results?[safe : index]
    }
}
