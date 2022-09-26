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
        
        do {
            // Decode JSON object to required type
            decodedCurrencies = try JSONDecoder().decode([Currency].self, from: data)
            
            // If there is no error in decoding then let interactor know
            homeInteractor?.didDecodeCurrencies()
            
        } catch(let error) {
            print(error)
        }
        
    }
    
}
