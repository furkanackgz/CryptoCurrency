//
//  LoginNetwork.swift
//  CryptoCurrency
//
//  Created by Furkan Açıkgöz on 6.09.2022.
//

import Foundation
import FirebaseAuth

class LoginNetwork {
    static let shared = LoginNetwork()
    private let session = URLSession.shared
}

extension LoginNetwork {
    
    func login(with email: String, and password: String,
               completion:@escaping (Result<AuthDataResult,Error>) -> () ) {
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            
            if error != nil {
                completion(.failure(error!))
            } else {
                completion(.success(authResult!))
            }
            
        }
        
    }
    
}
