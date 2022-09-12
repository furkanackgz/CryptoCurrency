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
        
        // If the user is previously signed in, navigate to
        // main page. Otherwise show login page.
        if UserDefaults.standard.bool(forKey: "isLogin") {
            
            if let loginView = loginView as? LoginView {
                loginRouter.navigateToMainPage(loginView)
            }
            
        } else {
            loginView.setupUI()
        }
        
    }
    
    func didPressLoginButton(_ email: String, _ password: String) {
        loginInteractor.sendLoginRequest(with: email, and: password)
    }
    
    func didPressSignUpButton() {
        
        if let loginView = loginView as? LoginView {
            loginRouter.navigateToSignUpPage(loginView)
        }
        
    }
    
}

// MARK: - Interactor related
extension LoginPresenter {
    
    func didReceiveLoginResponse() {
        guard let loginResponse = loginInteractor.loginResponse else { return }
        
        if loginResponse.isEmailVerified! {
            
            // Save user login info
            UserDefaults.standard.set(true, forKey: "isLogin")
            
            // Navigate to main page
            if let loginView = loginView as? LoginView {
                loginRouter.navigateToMainPage(loginView)
            }
            
        } else {
            
            guard let message = loginResponse.error else { return }
            
            loginView.displayAlertView(with: "Error", and: message)
            
        }
    }
    
}
