//
//  HomeView.swift
//  CryptoCurrency
//
//  Created by Furkan Açıkgöz on 19.09.2022.
//

import UIKit

class HomeView: UIViewController, HomeContract.homeView {

    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var currenciesTableView: UITableView!
    
    var homePresenter: HomeContract.homePresenter?
    
    private var currenciesTableViewHelper: CurrenciesTableViewHelper!
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homePresenter?.viewDidLoad()
        
        setupUI()
    }

}

// Self related
extension HomeView {
    
    // MARK: - setupUI
    private func setupUI() {
        
        // Set background color
        setBackgroundColor()
        
        // Set navigation bar
        setNavigationBar()
        
        // Create currencies table view helper and assign it
        currenciesTableViewHelper = .init(homePresenter: homePresenter!,
                                          currenciesTableView: currenciesTableView,
                                          homeView: self)
        
    }
    
    /**
     Sets background color as gradient.
     */
    // MARK: - setBackgroundColor
    private func setBackgroundColor() {
        
        let colorTop = ThemeManager.colors.backgroundColor!
        let colorBottom = UIColor.black
        
        let gl = CAGradientLayer()
        
        gl.frame = view.bounds
        gl.colors = [colorTop.cgColor, colorBottom.cgColor]
        view.layer.insertSublayer(gl, at: 0)
        containerView.backgroundColor = .clear
        
    }
    
    // MARK: - setNavigationBar
    private func setNavigationBar() {
        
        // Set navigation bar back button
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.topItem?.backButtonDisplayMode = .minimal
        
        // Create navigation title's attributes
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.init(name: "Marker Felt", size: 26)!,
            .foregroundColor: UIColor.white
        ]
        
        // Create navigation bar's appearance
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .clear
        appearance.titleTextAttributes = attributes
        
        // Set navigation bar appearance
        navigationController?.navigationBar.standardAppearance = appearance
        
        // Set navigation bar title
        
        title = "Home"
        
        // Set navigation portfolio button
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Portfolio",
                                                           style: .done,
                                                           target: self,
                                                           action: #selector(didPressPortfolioBarButton))
    }
    
}

// Presenter related
extension HomeView {
    
    // MARK: - updateTableView
    func updateTableView(currencies: [Currency]) {
        currenciesTableViewHelper.set(currencies: currencies)
    }
    
}

// MARK: - @objc methods
extension HomeView {
    
    @objc private func didPressPortfolioBarButton() {
        homePresenter?.didPressPortfolioButton()
    }
    
}
