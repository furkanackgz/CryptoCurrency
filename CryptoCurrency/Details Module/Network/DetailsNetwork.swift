//
//  DetailsNetwork.swift
//  CryptoCurrency
//
//  Created by Furkan Açıkgöz on 27.09.2022.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class DetailsNetwork {
    static let shared = DetailsNetwork()
    private let session = URLSession.shared
    private let db = Firestore.firestore()
}

// Add currency to the portfolio
extension DetailsNetwork {
    
    // MARK: - add
    func add(currency: Currency, completion:@escaping (String) -> Void) {
        
        do {
            // Add currency to the portfolio
            try db.collection("portfolio").document(currency.id!).setData(from: currency)
            
            // Let interactor know that currency is added to portfolio
            completion("Succesfully added!")
            
        } catch let error {
            print("Error writing city to Firestore: \(error)")
            
            // Let interactor know that currency cannot be added to portfolio
            completion("Error adding currency!")
        }
        
    }
    
}

// Remove currency from the portfolio
extension DetailsNetwork {
    
    // MARK: - remove
    func remove(currency: Currency, completion:@escaping (String) -> Void) {
        
        db.collection("portfolio").document(currency.id!).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
                
                // Let interactor know that currency cannot be removed to portfolio
                completion("Error removing currency!")
            } else {
                
                // Let interactor know that currency is removed from portfolio
                completion("Succesfully removed!")
            }
        }
        
    }
    
}
