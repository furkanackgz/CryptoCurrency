//
//  HomeContract.swift
//  CryptoCurrency
//
//  Created by Furkan Açıkgöz on 19.09.2022.
//

import Foundation

// MARK: - HomeContract
struct HomeContract {
    typealias homeView = HomeViewProtocol
    typealias homeInteractor = HomeInteractorProcotol
    typealias homePresenter = HomePresenterProtocol
    typealias homeEntity = HomeEntityProtocol
    typealias homeRouter = HomeRouterProtocol
}

// MARK: - HomeViewProtocol
protocol HomeViewProtocol: AnyObject {
    // Presenter related
    var homePresenter: HomeContract.homePresenter? { get set }
    func updateTableView(currencies: [Currency])
}

// MARK: - HomeInteractorProcotol
protocol HomeInteractorProcotol: AnyObject {
    // Presenter related
    var homePresenter: HomeContract.homePresenter? { get set }
    var currencies: [Currency]? { get set }
    func fetchCurrencies()
    
    // Entity related
    var homeEntity: HomeContract.homeEntity! { get set }
    func didDecodeCurrencies()
    
}

// MARK: - HomePresenterProtocol
protocol HomePresenterProtocol: AnyObject {
    // View related
    var homeView: HomeContract.homeView! { get set }
    func viewDidLoad()
    func didSelectCurrency(currency: Currency)
    func didPressPortfolioButton()
    
    // Interactor related
    var homeInteractor: HomeContract.homeInteractor! { get set }
    func didFetchCurrencies()
    
    // Router related
    var homeRouter: HomeContract.homeRouter! { get set }
}

// MARK: - HomeEntityProtocol
protocol HomeEntityProtocol: AnyObject {
    // Interactor related
    var homeInteractor: HomeContract.homeInteractor? { get set }
    var decodedCurrencies: [Currency]? { get set }
    func decodeCurrencies(data: Data)
}

// MARK: - HomeRouterProtocol
protocol HomeRouterProtocol: AnyObject {
    // View related
    var homeView: HomeView? { get set }
    
    // Presenter related
    func navigateToDetailsPage()
    func navigateToPortfolioPage()
}
