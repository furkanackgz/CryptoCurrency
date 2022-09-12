//
//  SignUpContract.swift
//  CryptoCurrency
//
//  Created by Furkan Açıkgöz on 12.09.2022.
//

import Foundation

struct SignUpContract {
    typealias signUpView = SignUpViewProtocol
    typealias signUpInteractor = SignUpInteractorProtocol
    typealias signUpPresenter = SignUpPresenterProtocol
    typealias signUpRouter = SignUpRouterProtocol
}

// MARK: - SignUpViewProtocol
protocol SignUpViewProtocol: AnyObject {
    // Presenter related
    var signUpPresenter: SignUpContract.signUpPresenter? { get set }
    func displayAlert(title: String, message: String)
}

// MARK: - SignUpInteractorProtocol
protocol SignUpInteractorProtocol: AnyObject {
    // Presenter related
    var signUpResponse: SignUpResponse? { get set }
    var signUpPresenter: SignUpContract.signUpPresenter? { get set }
    func sendSignUpRequest(email: String, password: String)
}

// MARK: - SignUpPresenterProtocol
protocol SignUpPresenterProtocol: AnyObject {
    // View related
    var signUpView: SignUpContract.signUpView! { get set }
    func didPressSignUpButton(email: String, password: String)
    
    // Interactor related
    var signUpInteractor: SignUpContract.signUpInteractor! { get set }
    func didReceiveSignUpResponse()
    
    // Router related
    var signUpRouter: SignUpContract.signUpRouter! { get set }
}

// MARK: - SignUpRouterProtocol
protocol SignUpRouterProtocol: AnyObject {
    // Presenter related
    func navigateToMainPage(_ signUpResponse: SignUpResponse)
}
