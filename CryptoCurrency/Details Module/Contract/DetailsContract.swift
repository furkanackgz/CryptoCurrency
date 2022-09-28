//
//  DetailsContract.swift
//  CryptoCurrency
//
//  Created by Furkan Açıkgöz on 27.09.2022.
//

import Foundation
import Charts

// MARK: - DetailsContract
struct DetailsContract {
    typealias detailsView = DetailsViewProtocol
    typealias detailsInteractor = DetailsInteractorProtocol
    typealias detailsPresenter = DetailsPresenterProtocol
    typealias detailsRouter = DetailsRouterProtocol
}

// MARK: - DetailsViewProtocol
protocol DetailsViewProtocol: AnyObject {
    // Presenter related
    var detailsPresenter: DetailsContract.detailsPresenter? { get set }
    func setupUI(selectedCurrency: Currency,
                 isCurrencySaved: Bool,
                 chartData: LineChartData)
}

// MARK: - DetailsInteractorProtocol
protocol DetailsInteractorProtocol: AnyObject {
    // Presenter related
    var detailsPresenter: DetailsContract.detailsPresenter? { get set }
    var selectedCurrency: Currency? { get set }
    func addToPortfolio()
    func removeFromPortfolio()
}

// MARK: - DetailsPresenterProtocol
protocol DetailsPresenterProtocol: AnyObject {
    // View related
    var detailsView: DetailsContract.detailsView! { get set }
    func viewDidLoad()
    func didPressBarButton(of type: String)
    
    // Interactor related
    var detailsInteractor: DetailsContract.detailsInteractor! { get set }
    func didFinishBarButtonAction()
    
    // Router related
    var detailsRouter: DetailsContract.detailsRouter! { get set }
}

// MARK: - DetailsRouterProtocol
protocol DetailsRouterProtocol: AnyObject {
    // Presenter related
    var detailsView: DetailsView? { get set }
    func navigateBackToPreviousPage()
}
