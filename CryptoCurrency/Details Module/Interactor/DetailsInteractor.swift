//
//  DetailsInteractor.swift
//  CryptoCurrency
//
//  Created by Furkan Açıkgöz on 27.09.2022.
//

import Foundation

class DetailsInteractor: DetailsContract.detailsInteractor {
    
    var detailsPresenter: DetailsContract.detailsPresenter?
    
    var selectedCurrency: Currency?
    
}

// Presenter related
extension DetailsInteractor {
    
    // MARK: - addToPortfolio
    func addToPortfolio() {
        
        // Unwrap selected currency
        guard let currency = selectedCurrency else { return }
        
        DetailsNetwork.shared.add(currency: currency) { [weak self] response in
            self?.detailsPresenter?.didFinishBarButtonAction(title: response)
        }
    }
    
    // MARK: - removeFromPortfolio
    func removeFromPortfolio() {
        
        // Unwrap selected currency
        guard let currency = selectedCurrency else { return }
        
        DetailsNetwork.shared.remove(currency: currency) { [weak self] response in
            self?.detailsPresenter?.didFinishBarButtonAction(title: response)
        }
    }
    
}
