//
//  LoginPresenter.swift
//  CryptoCurrency
//
//  Created by Furkan Açıkgöz on 6.09.2022.
//

import Foundation

class LoginPresenter: LoginContract.loginPresenter {
    
    var loginView: LoginContract.loginView!
    
    var loginInteractor: LoginContract.loginInteractor!
    
    var loginRouter: LoginContract.loginRouter!
    
}

// MARK: - View related
extension LoginPresenter {
    
    func viewDidLoad() {
        
    }
    
    func didPressLoginButton(_ email: String, _ password: String) {
        
    }
    
    func didPressSignUpButton() {
        
    }
    
}

// MARK: - Interactor related
extension LoginPresenter {
    
    func didReceiveLoginResponse(_ response: LoginResponse) {
        
    }
    
}
