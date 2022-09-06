//
//  LoginContractHelper.swift
//  CryptoCurrency
//
//  Created by Furkan Açıkgöz on 6.09.2022.
//

import UIKit

extension LoginContract {
    
    /**
     Instantiates login module by instantiating login view and
     binding rest of the layers together.
     */
    static func instantiateLoginModule() -> UIViewController? {
        
        if let loginView = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "LoginView") as? LoginView {
            
            // Instantiate related login layer
            let loginInteractor = LoginInteractor()
            let loginPresenter = LoginPresenter()
            let loginRouter = LoginRouter()
            
            // View-Presenter binding
            loginView.loginPresenter = loginPresenter
            loginPresenter.loginView = loginView
            
            // Interactor-Presenter binding
            loginInteractor.loginPresenter = loginPresenter
            loginPresenter.loginInteractor = loginInteractor
            
            // Router-Presenter binding
            loginPresenter.loginRouter = loginRouter
            
            return loginView
        }
        
        return nil
    }
    
}
