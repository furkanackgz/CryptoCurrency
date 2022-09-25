//
//  HomeInteractor.swift
//  CryptoCurrency
//
//  Created by Furkan Açıkgöz on 19.09.2022.
//

import Foundation

class HomeInteractor: HomeContract.homeInteractor {
    
    var currencies: [Currency]?
    
    var homePresenter: HomeContract.homePresenter?
        
    var homeEntity: HomeContract.homeEntity!

}

// Presenter related
extension HomeInteractor {
    
    func fetchCurrencies() {
        
    }
    
}

// Entity related
extension HomeInteractor {
    
    func didDecodeCurrencies() {
        
    }
    
}
