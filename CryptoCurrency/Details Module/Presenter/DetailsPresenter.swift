//
//  DetailsPresenter.swift
//  CryptoCurrency
//
//  Created by Furkan Açıkgöz on 27.09.2022.
//

import Foundation
import Charts

class DetailsPresenter: DetailsContract.detailsPresenter {
    
    var detailsView: DetailsContract.detailsView!
    
    var detailsInteractor: DetailsContract.detailsInteractor!
    
    var detailsRouter: DetailsContract.detailsRouter!
    
}

// Self related
extension DetailsPresenter {
    
    // MARK: - createGraphLines
    private func createLineChartData(_ prices: [Double]) -> LineChartData {
        
        var lineChartEntries = [ChartDataEntry]()
        var xValue: Double = 1
        
        prices.forEach { price in
            lineChartEntries.append(ChartDataEntry(x: xValue, y: price))
            xValue += 1
        }
        
        let dataSet = LineChartDataSet(entries: lineChartEntries, label: "")
        dataSet.drawCirclesEnabled = false
        let chartData = LineChartData(dataSet: dataSet)
        return chartData
      
    }
    
}

// View related
extension DetailsPresenter {
    
    // MARK: - viewDidLoad
    func viewDidLoad() {
        
        // Get selected currency from interactor layer
        guard let selectedCurrency = detailsInteractor.selectedCurrency else { return }
        
        // Get currency id from user defaults to get to know whether it is saved
        let isCurrencySaved = UserDefaults.standard.bool(forKey: selectedCurrency.id!)
        
        // Get the line chart data
        let chartData = createLineChartData(selectedCurrency.sparklineIn7d.price!)
        
        // Call view layer to setup ui elements with the parameters taken above
        detailsView.setupUI(selectedCurrency: selectedCurrency,
                            isCurrencySaved: isCurrencySaved,
                            chartData: chartData)
    }
    
    // MARK: - didPressBarButton
    func didPressBarButton(of type: String) {
        
        // Call interactor layer with the type of bar button action
        switch type {
        case "Remove":
            detailsInteractor.removeFromPortfolio()
        case "Add":
            detailsInteractor.addToPortfolio()
        default:
            print("Wrong type!")
        }
        
    }
    
    // MARK: - didPressAlertButton
    func didPressAlertButton() {
        detailsRouter.navigateBackToPreviousPage()
    }
    
}

// View related
extension DetailsPresenter {
    
    // MARK: - didFinishBarButtonAction
    func didFinishBarButtonAction(title: String) {
        
        // Get the currency from interactor layer
        guard let selectedCurrency = detailsInteractor.selectedCurrency else { return }
        
        // If currency is succesfully added or deleted, inform the user
        // and update user defaults
        switch title {
        case "Succesfully added!":
            UserDefaults.standard.set(true, forKey: selectedCurrency.id!)
            detailsView.displayAlert(title: title, message: "You can check it in portfolio!")
            
        case "Succesfully removed!":
            UserDefaults.standard.removeObject(forKey: selectedCurrency.id!)
            detailsView.displayAlert(title: title, message: "If exists, you can check your other currencies in portfolio!")
        default:
            print("Response error!")
        }
        
        
    }
    
}
