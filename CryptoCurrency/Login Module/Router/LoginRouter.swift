//
//  LoginRouter.swift
//  CryptoCurrency
//
//  Created by Furkan Açıkgöz on 6.09.2022.
//

import UIKit

class LoginRouter: LoginContract.loginRouter {
    
}

// MARK: - Presenter related
extension LoginRouter {
    
    func navigateToSignUpPage(_ loginView: LoginView) {
        
        guard let signUpView = SignUpContract.instantiateSignUpModule() else { return }
        
        loginView.navigationController?.pushViewController(signUpView, animated: true)
        
    }
    
    func navigateToMainPage(_ loginView: LoginView) {
        
    }
    
}
