//
//  DetailsContractHelper.swift
//  CryptoCurrency
//
//  Created by Furkan Açıkgöz on 27.09.2022.
//

import UIKit

extension DetailsContract {
    
    static func instantiateDetailsModule(with selectedCurrency: Currency) -> UIViewController? {
        
        if let detailsView = UIStoryboard(name: "Details", bundle: nil).instantiateViewController(withIdentifier: "DetailsView") as? DetailsView {
            
            // Instantiate related layers
            let detailsInteractor = DetailsInteractor()
            let detailsPresenter = DetailsPresenter()
            let detailsRouter = DetailsRouter()
            
            // Assign selected currency to interactor layer
            detailsInteractor.selectedCurrency = selectedCurrency
            
            // View-Presenter binding
            detailsView.detailsPresenter = detailsPresenter
            detailsPresenter.detailsView = detailsView
            
            // Interactor-Presenter binding
            detailsInteractor.detailsPresenter = detailsPresenter
            detailsPresenter.detailsInteractor = detailsInteractor
            
            // Presenter-Router binding
            detailsPresenter.detailsRouter = detailsRouter
            
            // Router-View binding
            detailsRouter.detailsView = detailsView
            
            return detailsView
            
        }
        
        return nil
        
    }
    
}
