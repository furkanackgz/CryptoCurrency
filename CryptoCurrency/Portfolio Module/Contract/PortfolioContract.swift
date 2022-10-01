//
//  PortfolioContract.swift
//  CryptoCurrency
//
//  Created by Furkan Açıkgöz on 30.09.2022.
//

import Foundation

// MARK: - PortfolioContract
struct PortfolioContract {
    typealias portfolioView = PortfolioViewProtocol
    typealias portfolioInteractor = PortfolioInteractorProtocol
    typealias portfolioPresenter = PortfolioPresenterProtocol
    typealias portfolioRouter = PortfolioRouterProtocol
}

// MARK: - PortfolioViewProtocol
protocol PortfolioViewProtocol: AnyObject {
    // Presenter related
    var portfolioPresenter: PortfolioContract.portfolioPresenter? { get set }
    func setupUI(with currencies: [Currency])
    func updateCurrenciesCollectionView(with currencies: [Currency])
}

//MARK: - PortfolioInteractorProtocol
protocol PortfolioInteractorProtocol: AnyObject {
    // Presenter related
    var portfolioPresenter: PortfolioContract.portfolioPresenter? { get set }
    var currencies: [Currency]? { get set }
    func fetchCurrencies()
}

// MARK: - PortfolioPresenterProtocol
protocol PortfolioPresenterProtocol: AnyObject {
    // View related
    var portfolioView: PortfolioContract.portfolioView! { get set }
    func viewWillAppear()
    func didEditSearchBarText(searchText: String)
    func didSelectCurrency(currency: Currency)
    func didPressSignOutBarButton()
    
    // Interactor related
    var portfolioInteractor: PortfolioContract.portfolioInteractor! { get set }
    func didFetchCurrencies()
    
    // Router related
    var portfolioRouter: PortfolioContract.portfolioRouter! { get set }
}

// MARK: - PortfolioRouterProtocol
protocol PortfolioRouterProtocol: AnyObject {
    // Presenter related
    var portfolioView: PortfolioView? { get set }
    func navigateToDetailsPage(with currency: Currency)
    func navigateBackToLoginPage()
}
