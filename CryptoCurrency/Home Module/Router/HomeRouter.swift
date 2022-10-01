//
//  HomeRouter.swift
//  CryptoCurrency
//
//  Created by Furkan Açıkgöz on 19.09.2022.
//

import UIKit

class HomeRouter: HomeContract.homeRouter {
    
    var homeView: HomeView?
    
}

// Presenter related
extension HomeRouter {
    
    func navigateToDetailsPage(_ selectedCurrency: Currency) {
        
        guard let detailsView = DetailsContract.instantiateDetailsModule(with: selectedCurrency) else { return }
        
        homeView?.navigationController?.pushViewController(detailsView, animated: true)
        
    }
    
    func navigateToPortfolioPage() {
        
        guard let portfolioView = PortfolioContract.instantiatePortfolioModule() else { return }
        
        homeView?.navigationController?.pushViewController(portfolioView, animated: true)
        
    }
    
    
}
