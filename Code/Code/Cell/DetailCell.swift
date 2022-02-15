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
    weak  var delegate : WatchListDelegate?
    @IBOutlet weak var originalTitleLabel: UILabel!
    @IBOutlet weak var overView: UILabel!
    @IBOutlet weak var popularity: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var voteCount: UILabel!
    @IBOutlet weak var addedToWatchlist: UIButton!
    var viewModel : MovieCellViewModel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func addedToWatchList(_ sender: Any) {
        viewModel.ctaAddedToWatchListAction()
        updateImage()
        delegate?.didUpdateCell()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func  refreshUI(vm: MovieCellViewModel) {
        //self.movie = movie
        viewModel  = vm
        originalTitleLabel.text = vm.getOriginalTitle()
        titleLabel.text = vm.getMovieTitle()
        overView.text = vm.getOverView()
        releaseDate.text = vm.getReleaseDate()
        popularity.text = vm.getPopularity()
        releaseDateTopConstraint.constant =  (popularity.text != nil) ? 4 : 0
        voteCountTopConstraint.constant =  (releaseDate.text != nil) ? 4 : 0
        voteCount.text =  vm.getVoteCount()
        updateImage()
    }
    
    private func updateImage(){
        addedToWatchlist.setImage( UIImage(named: viewModel.getImage()), for: .normal)
    }
}
