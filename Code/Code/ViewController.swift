//
//  ViewController.swift
//  Code
//
//  Created by Yogesh2 Gupta on 13/02/22.
//

import UIKit
import SVProgressHUD
import UIScrollView_InfiniteScroll

class ViewController: UIViewController {
    let vm  =  MovieViewModel()
    @IBOutlet weak var tableView: UITableView!
    /** refreshControl : It is used when user swipe from up. When os detects a swipe then "pullToRefresh" function will be called */
    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(pullToRefresh(_:)),
                                 for: UIControl.Event.valueChanged)
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.prefersLargeTitles = true
        tableViewSetup()
        getData(page: 1, showLoader: true)
        tableView.addInfiniteScroll { [weak self](tableView) -> Void in
            self?.getData(page: ((self?.vm.movies?.page ?? 0) + 1), showLoader: false)
        }
        self.title = Constant.ViewTitle.landingPage
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshView()
    }
    /** When user swipe down then below function will call and fetch first batch data from remote*/
    @objc private func pullToRefresh(_ refreshControl: UIRefreshControl){
     //  DataManager.sharedInstance.offsetVal = 0
       getData(page: 1, showLoader: true)
       refreshControl.endRefreshing()
    }
    
    private func getData(page : Int, showLoader : Bool){
        if showLoader {
            SVProgressHUD.show()
        }
        vm.getDataforPage(page) { [weak self] result, error in
            self?.tableView.finishInfiniteScroll()
            SVProgressHUD.dismiss()
            self?.refreshView()
        }
    }

}


extension ViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.movies?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.ViewIdentifier.landingCell, for: indexPath)
        if let cellClass =  cell as? LandingCell {
            cellClass.refreshUI(movie: vm.movies?.results?[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigateToDetailScreen(movie: vm.movies?.results?[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func navigateToDetailScreen(movie : Movie?){
        let detailController =  self.storyboard?.instantiateViewController(withIdentifier: Constant.ViewIdentifier.detailController) as? DetailController
        detailController?.movie = movie
        navigationController?.pushViewController(detailController!, animated: true)
    }
    
    func refreshView(){
        tableView.reloadData()
    }
    
    func registerCell() {
        let nib = UINib(nibName: Constant.ViewIdentifier.landingCell, bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: Constant.ViewIdentifier.landingCell)
    }
    
    func tableViewSetup() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.rowHeight = UITableView.automaticDimension
        tableView.refreshControl        = refreshControl
       registerCell()
    }
}
