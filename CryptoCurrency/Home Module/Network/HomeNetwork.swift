//
//  HomeNetwork.swift
//  CryptoCurrency
//
//  Created by Furkan Açıkgöz on 19.09.2022.
//

import Foundation

class HomeNetwork {
    static let shared = HomeNetwork()
    private let session = URLSession.shared
}

extension HomeNetwork {
    
    func fetchCurrencies(completion:@escaping (Data)->(Void) ) {
        
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd"
        
        guard let url = URL(string: urlString) else { return }
        
        let task = session.dataTask(with: url) { data, response, error in
            
            if error != nil {
                print(error!)
            } else {
                
                if let data = data {
                    completion(data)
                }
                
            }
            
        }
        task.resume()
        
    }
    
}
