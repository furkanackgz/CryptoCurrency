//
//  HomeContractHelper.swift
//  CryptoCurrency
//
//  Created by Furkan Açıkgöz on 19.09.2022.
//

import UIKit

extension HomeContract {
    
    static func instantiateHomeModule() -> UIViewController? {
        
        if let homeView = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeView") as? HomeView {
            
            // Instantiate related layers
            let homeInteractor = HomeInteractor()
            let homePresenter = HomePresenter()
            let homeEntity = HomeEntity()
            let homeRouter = HomeRouter()
            
            // View-Presenter binding
            homeView.homePresenter = homePresenter
            homePresenter.homeView = homeView
            
            // Interactor-Presenter binding
            homeInteractor.homePresenter = homePresenter
            homePresenter.homeInteractor = homeInteractor
            
            // Entity-Interactor binding
            homeEntity.homeInteractor = homeInteractor
            homeInteractor.homeEntity = homeEntity
            
            // Router-Presenter binding
            homePresenter.homeRouter = homeRouter
            
            // View-Router binding
            homeRouter.homeView = homeView
            
            
            return homeView
        }
        
        return nil
    }
    
}
