//
//  DetailsRouter.swift
//  CryptoCurrency
//
//  Created by Furkan Açıkgöz on 27.09.2022.
//

import UIKit

class DetailsRouter: DetailsContract.detailsRouter {
    
    var detailsView: DetailsView?
    
}

// Presenter related
extension DetailsRouter {
    
    // MARK: - navigateBackToPreviousPage
    func navigateBackToPreviousPage() {
        detailsView?.navigationController?.popViewController(animated: true)
    }
    
}
