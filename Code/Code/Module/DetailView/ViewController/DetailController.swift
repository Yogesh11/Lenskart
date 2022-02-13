//
//  DetailController.swift
//  Code
//
//  Created by Yogesh2 Gupta on 13/02/22.
//

import UIKit

class DetailController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var movie : Movie?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title =  movie?.title ?? Constant.ViewTitle.detailPage
        tableViewSetup()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension DetailController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.ViewIdentifier.detailCell, for: indexPath)
        if let cellClass =  cell as? DetailCell {
            cellClass.refreshUI(movie: movie)
            cellClass.selectionStyle  = .none
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (movie != nil) ? 1 : 0
    }
    
    func registerCell() {
        let nib = UINib(nibName: Constant.ViewIdentifier.detailCell, bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: Constant.ViewIdentifier.detailCell)
    }
    func tableViewSetup() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.rowHeight = UITableView.automaticDimension
        registerCell()
    }
}
