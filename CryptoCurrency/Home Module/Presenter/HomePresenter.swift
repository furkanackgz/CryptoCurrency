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
        
    }
    
    func didSelectCurrency(currency: Currency) {
        
    }
    
}

// Interactor related
extension HomePresenter {
    
    func didFetchCurrencies() {
        
    }
    
}
