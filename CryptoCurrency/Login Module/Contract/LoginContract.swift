//
//  LoginContract.swift
//  CryptoCurrency
//
//  Created by Furkan Açıkgöz on 6.09.2022.
//

import Foundation

// MARK: - LoginContract
struct LoginContract {
    typealias loginView = LoginViewProtocol
    typealias loginInteractor = LoginInteractorProtocol
    typealias loginPresenter = LoginPresenterProtocol
    typealias loginRouter = LoginRouterProtocol
}

// MARK: - LoginViewProtocol
protocol LoginViewProtocol: AnyObject {
    // Presenter related
    var loginPresenter: LoginContract.loginPresenter? { get set }
    func setupUI()
    func displayAlertView(with title: String, and message: String)
}

// MARK: - LoginInteractorProtocol
protocol LoginInteractorProtocol: AnyObject {
    // Presenter related
    var loginPresenter: LoginContract.loginPresenter? { get set }
    var loginResponse: LoginResponse? { get set }
    func sendLoginRequest(with email: String, and password: String)
}

// MARK: - LoginPresenterProtocol
protocol LoginPresenterProtocol: AnyObject {
    // View related
    var loginView: LoginContract.loginView! { get set }
    func viewDidLoad()
    func didPressLoginButton(_ email: String, _ password: String)
    func didPressSignUpButton()
    
    // Interactor related
    var loginInteractor: LoginContract.loginInteractor! { get set }
    func didReceiveLoginResponse()
    
    // Router related
    var loginRouter: LoginContract.loginRouter! { get set }
}

// MARK: - LoginRouterProtocol
protocol LoginRouterProtocol: AnyObject {
    // Presenter related
    func navigateToSignUpPage(_ loginView: LoginContract.loginView)
    func navigateToMainPage(_ loginView: LoginContract.loginView)
}
