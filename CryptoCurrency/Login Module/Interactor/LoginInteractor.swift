//
//  LoginInteractor.swift
//  CryptoCurrency
//
//  Created by Furkan Açıkgöz on 6.09.2022.
//

import Foundation

class LoginInteractor: LoginContract.loginInteractor {
    
    var loginPresenter: LoginContract.loginPresenter?
    
    var loginResponse: LoginResponse?
    
}

// MARK: - Presenter related
extension LoginInteractor {
    
    func sendLoginRequest(with email: String, and password: String) {
        
    }
    
}
