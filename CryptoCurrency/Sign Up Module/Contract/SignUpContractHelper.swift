//
//  SignUpContractHelper.swift
//  CryptoCurrency
//
//  Created by Furkan Açıkgöz on 12.09.2022.
//


import UIKit

extension SignUpContract {
    
    static func instantiateSignUpModule() -> UIViewController? {
        
        if let signUpView = UIStoryboard(name: "SignUp", bundle: nil).instantiateViewController(withIdentifier: "SignUpView") as? SignUpView {
            
            // Instantiate related layers
            let signUpInteractor = SignUpInteractor()
            let signUpPresenter = SignUpPresenter()
            let signUpRouter = SignUpRouter()
            
            // View-Presenter binding
            signUpView.signUpPresenter = signUpPresenter
            signUpPresenter.signUpView = signUpView
            
            // Interactor-Presenter binding
            signUpInteractor.signUpPresenter = signUpPresenter
            signUpPresenter.signUpInteractor = signUpInteractor
            
            // Router-Presenter binding
            signUpPresenter.signUpRouter = signUpRouter
            
            return signUpView
        }
        
        return nil
    }
    
}
