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

// Self related
extension SignUpPresenter {
    
    // MARK: - checkPasswords
    private func checkPasswords(password: String, passwordAgain: String) -> Bool {
        
        if password != passwordAgain {
            return false
        }
        
        return true
    }
    
}

// View related
extension SignUpPresenter {
   
    // MARK: - didPressSignUpButton
    func didPressSignUpButton(email: String, password: String, passwordAgain: String) {
        
        if password != passwordAgain {
            signUpView.displayAlert(title: "Error",
                                    message: "Please make sure both passwords are the same!")
            
        } else {
            signUpInteractor.sendSignUpRequest(email: email, password: password)
        }
            
    }
    
}

// Interactor related
extension SignUpPresenter {
    
    // MARK: - didReceiveSignUpResponse
    func didReceiveSignUpResponse() {
        
        guard let signUpResponse = signUpInteractor.signUpResponse else { return }
        
        if signUpResponse.isEmailVerified! {
            
            // Save user login info
            UserDefaults.standard.set(true, forKey: "isLogin")
            
            // If email is verified, navigate to main page
            signUpRouter.navigateToMainPage(signUpResponse)
            
        } else {
            
            guard let message = signUpResponse.error else { return }
            
            signUpView.displayAlert(title: "Error!", message: message)
            
        }
        
    }
    
}
