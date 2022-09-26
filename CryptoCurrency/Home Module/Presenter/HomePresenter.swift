//
//  HomePresenter.swift
//  CryptoCurrency
//
//  Created by Furkan Açıkgöz on 19.09.2022.
//

import Foundation

class HomePresenter: HomeContract.homePresenter {

    var homeView: HomeContract.homeView!

    var homeInteractor: HomeContract.homeInteractor!
    
    var homeRouter: HomeContract.homeRouter!
    
}

// View related
extension HomePresenter {
    
    func viewDidLoad() {
        homeInteractor.fetchCurrencies()
    }
    
    func didSelectCurrency(currency: Currency) {
        
    }
    
}

// Interactor related
extension HomePresenter {
    
    func didFetchCurrencies() {
        
        guard let currencies = homeInteractor.currencies else { return }
        
        // Return back to main queue from background queue
        DispatchQueue.main.async { [weak self] in
            
            // Send data to view layer
            self?.homeView.updateTableView(currencies: currencies)
            
        }
        
    }
    
}
