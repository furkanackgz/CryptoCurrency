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
        
        HomeNetwork.shared.fetchCurrencies { [weak self] data in
            
            guard let self = self else { return }
            
            self.homeEntity.decodeCurrencies(data: data)
            
        }
        
    }
    
}

// Entity related
extension HomeInteractor {
    
    func didDecodeCurrencies() {
        
        guard let decodedCurrencies = homeEntity.decodedCurrencies else { return }
        
        // After getting decoded data from entity layer, let presenter
        // layer know that fetched data are ready to use.
        currencies = decodedCurrencies
        homePresenter?.didFetchCurrencies()
        
    }
    
}
