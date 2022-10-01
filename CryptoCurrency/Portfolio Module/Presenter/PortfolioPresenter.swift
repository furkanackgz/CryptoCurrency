//
//  PortfolioPresenter.swift
//  CryptoCurrency
//
//  Created by Furkan Açıkgöz on 30.09.2022.
//

import Foundation

class PortfolioPresenter: PortfolioContract.portfolioPresenter {
    
    var portfolioRouter: PortfolioContract.portfolioRouter!
    
    var portfolioView: PortfolioContract.portfolioView!
    
    var portfolioInteractor: PortfolioContract.portfolioInteractor!
    
}

// View related
extension PortfolioPresenter {
    
    // MARK: - viewDidLoad
    func viewWillAppear() {
        portfolioInteractor.fetchCurrencies()
    }
    
    // MARK: - didEditSearchBarText
    func didEditSearchBarText(searchText: String) {
        
        // Take provinces array from interactor layer
        guard let currencies = portfolioInteractor.currencies else { return }
        
        var filteredCurrencies = [Currency]()
        
        // If user didn't enter any character to
        // the search text
        if searchText == "" {
            
            // Assign all currencies since there is no filtered
            // search text
            filteredCurrencies = currencies
            
        } else {
            
            // Assign currencies which contains search text in it
            // to the filtered currencies
            filteredCurrencies = currencies.filter { $0.name!.localizedLowercase.contains(searchText.localizedLowercase)
            }
            
        }
        
        // Send filtered provinces to view layer
        portfolioView.updateCurrenciesCollectionView(with: filteredCurrencies)
        
    }
    
    // MARK: - didSelectCurrency
    func didSelectCurrency(currency: Currency) {
        portfolioRouter.navigateToDetailsPage(with: currency)
    }
    
    // MARK: - didPressSignOutBarButton
    func didPressSignOutBarButton() {
        
        // Save user login info as logout
        UserDefaults.standard.set(false, forKey: "isLogin")
        
        portfolioRouter.navigateBackToLoginPage()
    }
    
}

// Interactor related
extension PortfolioPresenter {
    
    // MARK: - didFetchCurrencies
    func didFetchCurrencies() {
        
        // Get currency and user info from interactor layer
        guard let currencies = portfolioInteractor.currencies else { return }
        
        // Send the above details to view layer
        DispatchQueue.main.async { [weak self] in
            self?.portfolioView.setupUI(with: currencies)
        }
        
    }
    
}

