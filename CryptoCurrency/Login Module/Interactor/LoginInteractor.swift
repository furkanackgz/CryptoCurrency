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
        LoginNetwork.shared.login(with: email, and: password) { [weak self] result in
            
            guard let self = self else { return }
            
            var loginResponse = LoginResponse()
            
            switch result {
            case .failure(let error):
                
                loginResponse.isEmailVerified = false
                loginResponse.error = error.localizedDescription
                
            case .success(let result):
                
                loginResponse.isEmailVerified = result.user.isEmailVerified
                loginResponse.email = result.user.email!
                loginResponse.phoneNumber = result.user.phoneNumber!
                loginResponse.uid = result.user.uid
                loginResponse.name = result.user.displayName!
                
            }
            
            // Let presenter layer know that login response object is initialized
            self.loginResponse = loginResponse
            self.loginPresenter?.didReceiveLoginResponse()
            
        }
    }
    
}
