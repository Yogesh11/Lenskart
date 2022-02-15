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
    private var  viewModel  :  MovieCellViewModel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func refreshUI(vm : MovieCellViewModel){
        viewModel = vm
        titleLabel.text = vm.getMovieTitle()
        popularity.text = vm.getPopularity()
        releaseDateTopConstraint.constant =  (popularity.text != nil) ? 4 : 0
        releaseDate.text = vm.getReleaseDate()
        overView.text = vm.getOverView()
        updateImage()
    }
    
    func updateImage(){
        addedToWatchlist.image = UIImage(named: viewModel.getImage())
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
