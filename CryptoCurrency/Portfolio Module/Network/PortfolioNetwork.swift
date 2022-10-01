//
//  PortfolioNetwork.swift
//  CryptoCurrency
//
//  Created by Furkan Açıkgöz on 30.09.2022.
//


import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class PortfolioNetwork {
    static let shared = PortfolioNetwork()
    private let session = URLSession.shared
    private let db = Firestore.firestore()
}

extension PortfolioNetwork {
    
    // MARK: - fetchCurrencies
    func fetchCurrencies(completion:@escaping ([Currency]) -> () ) {
        
        var currencies = [Currency]()
        
        db.collection("portfolio").getDocuments { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {

                    // Decode each document as Currency type and then
                    // append it to the currencies array
                    do {
                        let currency = try document.data(as: Currency.self)
                        currencies.append(currency)
                    } catch let error {
                        print(error)
                    }
                    
                }
            }
            
            // Send fetched currencies back to interactor layer
            completion(currencies)
        }
        
    }
    
}

