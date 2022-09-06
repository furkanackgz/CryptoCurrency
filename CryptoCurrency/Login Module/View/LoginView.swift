//
//  ViewController.swift
//  CryptoCurrency
//
//  Created by Furkan Açıkgöz on 6.09.2022.
//

import UIKit

class LoginView: UIViewController, LoginContract.loginView {
    
    var loginPresenter: LoginContract.loginPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

// MARK: - Presenter related
extension LoginView {
    
    func setupUI() {
        
    }
    
    func displayAlertView(with title: String, and message: String) {
        
    }
    
}
