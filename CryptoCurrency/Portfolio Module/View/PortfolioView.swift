//
//  PortfolioView.swift
//  CryptoCurrency
//
//  Created by Furkan Açıkgöz on 30.09.2022.
//

import UIKit

class PortfolioView: UIViewController, PortfolioContract.portfolioView {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var currenciesCollectionView: UICollectionView!
    
    var portfolioPresenter: PortfolioContract.portfolioPresenter?
        
    var currenciesCollectionViewHelper: CurrenciesCollectionViewHelper!
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Call view will appear function in presenter layer
        portfolioPresenter?.viewWillAppear()
        
        // Prepare search bar for later usage
        prepareSearchBar()
    }

}

// Self related
extension PortfolioView {
    
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
        navigationItem.title = "Portfolio"
        
        // Set navigation bar button
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign out",
                                                           style: .done,
                                                           target: self,
                                                           action: #selector(didPressBarButton))
        
    }
    
    // MARK: - setSearchBar
    private func setSearchBar() {
        
        // Set self as search bar delegate
        searchBar.delegate = self
        
        // Set search bar view background color as clear
        let image = UIImage()
        searchBar.backgroundImage = image
        searchBar.backgroundColor = .clear
        searchBar.barTintColor = .clear
        
        // Set search bar text field layer
        searchBar.searchTextField.layer.borderWidth = 1
        searchBar.searchTextField.layer.cornerRadius = 10
        searchBar.searchTextField.layer.borderColor = UIColor.white.cgColor
        
        // Set search bar magnifying symbol color
        searchBar.searchTextField.leftView?.tintColor = .white
        
        // Set search bar text field text color
        searchBar.searchTextField.textColor = .white
        
        // Set search bar placeholder as attributed
        searchBar.searchTextField.attributedPlaceholder = .init(string: "Search Currency",
                                                                attributes: [
                                                                    .foregroundColor: UIColor.white,
                                                                    .font: UIFont(name: "Marker Felt",
                                                                                  size: 18)!
                                                                ])
        
    }
    
    // MARK: - prepareSearchBar
    private func prepareSearchBar() {
        
        // Set search bar text to empty
        searchBar.text = ""
        
        // Call did edit search text for clearing out
        // the previously showing filtered provinces
        portfolioPresenter?.didEditSearchBarText(searchText: "")
        
        // Hide keyboard after moving to station page
        // if it is used
        searchBar.resignFirstResponder()
        
    }
    
}

// Presenter related
extension PortfolioView {
    
    // MARK: - setupUI
    func setupUI(with currencies: [Currency]) {
        
        // Set background color
        setBackgroundColor()
        
        // Set navigation bar
        setNavigationBar()
        
        // Set search bar
        setSearchBar()
        
        // Set collection view helper
        currenciesCollectionViewHelper = .init(currenciesCollectionView: currenciesCollectionView,
                                             currencies: currencies,
                                             portfolioPresenter: portfolioPresenter)
        
    }
    
    // MARK: - updateCurrenciesCollectionView
    func updateCurrenciesCollectionView(with currencies: [Currency]) {
        // Send currencies to collection view helper
        currenciesCollectionViewHelper.set(currencies: currencies)
    }
    
}

// Search bar related methods
extension PortfolioView: UISearchBarDelegate {
    
    // MARK: - searchBarTextDidChange
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        // Call didEditSearchText method in presenter for notifying
        // that search text was changed by the user
        portfolioPresenter?.didEditSearchBarText(searchText: searchText)
    }
    
    // MARK: - searchBarSearchButtonClicked
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // Dismiss the keyboard
        searchBar.resignFirstResponder()
    }
    
}

// @objc methods
extension PortfolioView {
    
    // MARK: - didPressBarButton
    @objc private func didPressBarButton() {
        portfolioPresenter?.didPressSignOutBarButton()
    }
    
}
