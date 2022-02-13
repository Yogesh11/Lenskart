//
//  MovieViewModel.swift
//  Code
//
//  Created by Yogesh2 Gupta on 13/02/22.
//

import UIKit

class MovieViewModel: NSObject {
    var movies : Movies? = nil
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
}
