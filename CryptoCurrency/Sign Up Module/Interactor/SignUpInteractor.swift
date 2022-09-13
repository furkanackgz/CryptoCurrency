//
//  SignUpInteractor.swift
//  CryptoCurrency
//
//  Created by Furkan Açıkgöz on 12.09.2022.
//

import Foundation

class SignUpInteractor: SignUpContract.signUpInteractor {
    
    var signUpPresenter: SignUpContract.signUpPresenter?
    
    var signUpResponse: SignUpResponse?
    
}

extension SignUpInteractor {
    
    func sendSignUpRequest(email: String, password: String) {
        
        SignUpNetwork.shared.signUp(with: email, and: password) { [weak self] result in
            
            var signUpResponse = SignUpResponse()
            
            switch result {
            case .failure(let error):
                signUpResponse.isEmailVerified = false
                signUpResponse.error = error.localizedDescription
            case .success(let userInfo):
                signUpResponse.isEmailVerified = userInfo.user.isEmailVerified
                signUpResponse.email = userInfo.user.email!
                //signUpResponse.phoneNumber = userInfo.user.phoneNumber!
                signUpResponse.uid = userInfo.user.uid
                signUpResponse.name = userInfo.user.displayName!
            }
            
            // Instantiate sign up response and call presenter layer
            self?.signUpResponse = signUpResponse
            self?.signUpPresenter?.didReceiveSignUpResponse()
        }
        
    }
    
}
