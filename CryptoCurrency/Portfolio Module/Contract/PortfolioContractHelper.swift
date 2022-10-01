//
//  PortfolioContractHelper.swift
//  CryptoCurrency
//
//  Created by Furkan Açıkgöz on 30.09.2022.
//

import UIKit

extension PortfolioContract {
    
    static func instantiatePortfolioModule() -> UIViewController? {
        
        if let portfolioView = UIStoryboard(name: "Portfolio", bundle: nil).instantiateViewController(withIdentifier: "PortfolioView") as? PortfolioView {
            
            // Instantiate related layers
            let portfolioInteractor = PortfolioInteractor()
            let portfolioPresenter = PortfolioPresenter()
            let portfolioRouter = PortfolioRouter()
            
            // View-Presenter binding
            portfolioView.portfolioPresenter = portfolioPresenter
            portfolioPresenter.portfolioView = portfolioView
            
            // Interactor-Presenter binding
            portfolioInteractor.portfolioPresenter = portfolioPresenter
            portfolioPresenter.portfolioInteractor = portfolioInteractor
            
            // Presenter-Router binding
            portfolioPresenter.portfolioRouter = portfolioRouter
            
            // Router-View binding
            portfolioRouter.portfolioView = portfolioView
            
            return portfolioView
        }
        
        return nil
    }
    
}
