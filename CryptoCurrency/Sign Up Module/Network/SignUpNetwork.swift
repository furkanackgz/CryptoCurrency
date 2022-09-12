//
//  SignUpNetwork.swift
//  CryptoCurrency
//
//  Created by Furkan Açıkgöz on 12.09.2022.
//

import Foundation
import FirebaseAuth

class SignUpNetwork {
    static let shared = SignUpNetwork()
    private let session = URLSession.shared
}

extension SignUpNetwork {
    
    func signUp(with email: String, and password: String,
                completion:@escaping (Result<AuthDataResult, Error>)->() ) {
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            
            if error != nil {
                completion(.failure(error!))
            } else {
                completion(.success(authResult!))
            }
        }
        
    }
    
}
