//
//  SignUpPresenter.swift
//  CryptoCurrency
//
//  Created by Furkan Açıkgöz on 12.09.2022.
//

import Foundation

class SignUpPresenter: SignUpContract.signUpPresenter {
    
    var signUpView: SignUpContract.signUpView!
    
    var signUpInteractor: SignUpContract.signUpInteractor!
    
    var signUpRouter: SignUpContract.signUpRouter!
    
}

// View related
extension SignUpPresenter {
   
    // MARK: - didPressSignUpButton
    func didPressSignUpButton(email: String, password: String) {
        signUpInteractor.sendSignUpRequest(email: email, password: password)
    }
    
}

// Interactor related
extension SignUpPresenter {
    
    // MARK: - didReceiveSignUpResponse
    func didReceiveSignUpResponse() {
        
        guard let signUpResponse = signUpInteractor.signUpResponse else { return }
        
        if signUpResponse.isEmailVerified! {
            
            // If email is verified, navigate to main page
            signUpRouter.navigateToMainPage(signUpResponse)
            
        } else {
            
            
            
        }
        
    }
    
}
