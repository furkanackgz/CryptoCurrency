//
//  PortfolioInteractor.swift
//  CryptoCurrency
//
//  Created by Furkan Açıkgöz on 30.09.2022.
//

import Foundation

class PortfolioInteractor: PortfolioContract.portfolioInteractor {
    
    var portfolioPresenter: PortfolioContract.portfolioPresenter?
    
    var currencies: [Currency]?
    
}

// Presenter related
extension PortfolioInteractor {
    
    // MARK: - fetchCurrencies
    func fetchCurrencies() {
        
        PortfolioNetwork.shared.fetchCurrencies { [weak self] currencies in
            
            // Assign fetched currencies
            self?.currencies = currencies
            
            // Let presenter layer know that currencies are fetched
            self?.portfolioPresenter?.didFetchCurrencies()
        }
        
    }
    
}

