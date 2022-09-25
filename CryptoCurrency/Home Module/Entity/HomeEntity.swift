//
//  HomeEntity.swift
//  CryptoCurrency
//
//  Created by Furkan Açıkgöz on 19.09.2022.
//

import Foundation

class HomeEntity: HomeContract.homeEntity {
    
    var decodedCurrencies: [Currency]?
    
    var homeInteractor: HomeContract.homeInteractor?
    
}

// Interactor related
extension HomeEntity {
    
    func decodeCurrencies(data: Data) {
        
    }
    
}
