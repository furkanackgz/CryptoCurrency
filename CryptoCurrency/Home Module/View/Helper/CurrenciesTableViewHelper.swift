//
//  CurrenciesTableViewHelper.swift
//  CryptoCurrency
//
//  Created by Furkan Açıkgöz on 25.09.2022.
//

import UIKit
import Kingfisher

class CurrenciesTableViewHelper: NSObject {
    
    private var homePresenter: HomeContract.homePresenter!
    
    private var currenciesTableView: UITableView!
    
    private var homeView: HomeView!
    
    private var currencies: [Currency]!
    
    init(homePresenter: HomeContract.homePresenter,
         currenciesTableView: UITableView,
         homeView: HomeView) {
        super.init()
        self.homePresenter = homePresenter
        self.currenciesTableView = currenciesTableView
        self.homeView = homeView
        
        setupUI()
    }
    
}

// Self related
extension CurrenciesTableViewHelper {
    
    // MARK: - setupUI
    private func setupUI() {
        
        // Register currency table view cell
        currenciesTableView.register(.init(nibName: "CurrencyTableViewCell", bundle: nil),
                                     forCellReuseIdentifier: "CurrencyTableViewCell")
        
    }
    
    
    
}

// Home view related
extension CurrenciesTableViewHelper {
    
    func set(currencies: [Currency]) {
        self.currencies = currencies
        
        // Animate reloding table view for better
        // user experience
        UIView.animate(withDuration: 0.375, delay: 0.5) { [weak self] in
            self?.currenciesTableView?.reloadData()
        }
    }
    
}

// Table view delegate
extension CurrenciesTableViewHelper: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Get the selected currency and send it to presenter layer
        let selectedCurrency = currencies[indexPath.row]
        homePresenter.didSelectCurrency(currency: selectedCurrency)
        
    }
    
}

// Table view data source
extension CurrenciesTableViewHelper: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyTableViewCell") as? CurrencyTableViewCell,
              let currencies = currencies else {
            return CurrencyTableViewCell()
        }
        
        // Set image view
        let imageURL = currencies[indexPath.row].image!
        cell.symbolImageView.kf.setImage(with: URL(string: imageURL))
        
        // Set name label
        cell.nameLabel.text = currencies[indexPath.row].name!
        
        // Set percentage label
        let percentage = currencies[indexPath.row].priceChangePercentage24h!
        
        if percentage >= 0 {
            cell.percentageLabel.textColor = .green
        } else {
            cell.percentageLabel.textColor = .red
        }
        
        cell.percentageLabel.text = "%\(percentage)"
        
        // Set price label
        cell.priceKeyLabel.text = "Price: "
        cell.priceValueLabel.text = String(currencies[indexPath.row].currentPrice!)
        
        // Set high 24h label
        cell.high24hKeyLabel.text = "High 24h: "
        cell.high24hValueLabel.text = String(currencies[indexPath.row].high24h!)
        
        // Set low 24h label
        cell.low24hKeyLabel.text = "Low 24h: "
        cell.low24hValueLabel.text = String(currencies[indexPath.row].low24h!)
        
        
        return cell
        
    }
    
}
