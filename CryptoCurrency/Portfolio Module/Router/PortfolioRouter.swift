//
//  PortfolioRouter.swift
//  CryptoCurrency
//
//  Created by Furkan Açıkgöz on 30.09.2022.
//

import UIKit

class PortfolioRouter: PortfolioContract.portfolioRouter {

    var portfolioView: PortfolioView?

}

// Presenter related
extension PortfolioRouter {
    
    // MARK: - navigateToDetailsPage
    func navigateToDetailsPage(with currency: Currency) {
        
        // Instantiate details module
        guard let detailsView = DetailsContract.instantiateDetailsModule(with: currency) else { return }
        
        // Navigate to details view
        portfolioView?.navigationController?.pushViewController(detailsView, animated: true)
        
    }
    
    // MARK: - navigateBackToLoginPage
    func navigateBackToLoginPage() {
        
        let viewControllers: [UIViewController] = (portfolioView?.navigationController!.viewControllers)!
        
        for viewController in viewControllers {
            if viewController is LoginView {
                portfolioView?.navigationController!.popToViewController(viewController, animated: true)
            }
        }
        
    }
    
}


