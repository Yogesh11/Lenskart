//
//  DetailCell.swift
//  Code
//
//  Created by Yogesh2 Gupta on 13/02/22.
//

import UIKit

class DetailCell: UITableViewCell {
    @IBOutlet weak var releaseDateTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var voteCountTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var originalTitleLabel: UILabel!
    @IBOutlet weak var overView: UILabel!
    @IBOutlet weak var popularity: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var voteCount: UILabel!
    @IBOutlet weak var addedToWatchlist: UIButton!
    var movie : Movie?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func addedToWatchList(_ sender: Any) {
        if movie?.addedToWatchList()  == true {
            movie?.removeFromWatchList()
            addToWatchList(false)
        } else{
            movie?.addToWatchList()
            addToWatchList(true)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func  refreshUI(movie: Movie?) {
        self.movie = movie
        originalTitleLabel.text = movie?.original_title
        titleLabel.text = movie?.title
        overView.text = movie?.overview
        if let releaseDateTxt = movie?.release_date, !releaseDateTxt.isEmpty  {
            releaseDate.text = Constant.DefaultText.releaseDate  + releaseDateTxt
            voteCountTopConstraint.constant = 4
        }  else{
            releaseDate.text = nil
            voteCountTopConstraint.constant = 0
        }
        
        if let val  = movie?.popularity,  val > 0 {
            popularity.text = Constant.DefaultText.popularity  + String(val)
            releaseDateTopConstraint.constant = 4
        } else{
            popularity.text = nil
            releaseDateTopConstraint.constant = 0
        }
        
        voteCount.text = Constant.DefaultText.vote + String((movie?.vote_count ?? 0))
        addToWatchList(movie?.addedToWatchList() ?? false)
    }
    
    private func addToWatchList(_ isAdded : Bool){
        addedToWatchlist.setImage( UIImage(named: isAdded  ?  Constant.Assets.addedToWatchList : Constant.Assets.defaultWatchList), for: .normal)
       
    }
}
