//
//  HomeView.swift
//  CryptoCurrency
//
//  Created by Furkan Açıkgöz on 19.09.2022.
//

import UIKit

class HomeView: UIViewController, HomeContract.homeView {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var currenciesTableView: UITableView!
    
    var homePresenter: HomeContract.homePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

// Presenter related
extension HomeView {
    
    // MARK: - updateTableView
    func updateTableView(currencies: [Currency]) {
        
    }
    
}
