//
//  LandingCell.swift
//  Code
//
//  Created by Yogesh2 Gupta on 13/02/22.
//

import UIKit

class LandingCell: UITableViewCell {
    @IBOutlet weak var releaseDateTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overView: UILabel!
    @IBOutlet weak var popularity: UILabel!
    @IBOutlet weak var addedToWatchlist: UIImageView!
    @IBOutlet weak var releaseDate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func refreshUI(movie : Movie?){
        titleLabel.text = movie?.title
        if let val  = movie?.popularity,  val > 0 {
            popularity.text = Constant.DefaultText.popularity  + String(val)
            releaseDateTopConstraint.constant = 4
        } else{
            popularity.text = nil
            releaseDateTopConstraint.constant = 0
        }
        if let releaseDateTxt = movie?.release_date, !releaseDateTxt.isEmpty  {
            releaseDate.text = Constant.DefaultText.releaseDate  + releaseDateTxt
        }  else{
            releaseDate.text = nil
        }
        overView.text = movie?.overview
        addedToWatchlist.image = UIImage(named: movie?.addedToWatchList() == true ?  Constant.Assets.addedToWatchList : Constant.Assets.defaultWatchList)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
