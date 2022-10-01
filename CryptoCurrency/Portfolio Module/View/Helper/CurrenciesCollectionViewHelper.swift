//
//  CurrenciesCollectionViewHelper.swift
//  CryptoCurrency
//
//  Created by Furkan Açıkgöz on 30.09.2022.
//

import UIKit
import Kingfisher

class CurrenciesCollectionViewHelper: NSObject {
    
    // MARK: - Features
    private weak var currenciesCollectionView: UICollectionView!
    private var currencies: [Currency]!
    
    var portfolioPresenter: PortfolioContract.portfolioPresenter!
    
    // MARK - init
    init(currenciesCollectionView: UICollectionView,
         currencies: [Currency],
         portfolioPresenter: PortfolioContract.portfolioPresenter!) {
        
        super.init()
        
        self.currenciesCollectionView = currenciesCollectionView
        self.currencies = currencies
        self.portfolioPresenter = portfolioPresenter
        
        // Assign self as delegate and data source of the collection view
        self.currenciesCollectionView.delegate = self
        self.currenciesCollectionView.dataSource = self
        
        // Register collection view cell
        currenciesCollectionView.register(.init(nibName: "CurrenciesCollectionViewCell", bundle: nil),
                                           forCellWithReuseIdentifier: "CurrenciesCollectionViewCell")
        
        // Assign compositional layout
        currenciesCollectionView.collectionViewLayout = self.createBasicListLayout()
        
    }
    
}

// Portfolio view related
extension CurrenciesCollectionViewHelper {
    
    // MARK: - set
    func set(currencies: [Currency]) {
        
        // Set currencies
        self.currencies = currencies
        
        // Animate reloding table view for better
        // user experience
        UIView.animate(withDuration: 0.375, delay: 0.5) { [weak self] in
            self?.currenciesCollectionView?.reloadData()
        }
        
    }
    
}

// Collection view delegate
extension CurrenciesCollectionViewHelper: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // Deselect currency after selecting it
        collectionView.deselectItem(at: indexPath, animated: true)
        
        // Get the selected currency
        let selectedCurrency = currencies[indexPath.item]
        portfolioPresenter.didSelectCurrency(currency: selectedCurrency)
        
    }
    
}

// Collection view data source
extension CurrenciesCollectionViewHelper: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        currencies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let currencyCell = currenciesCollectionView.dequeueReusableCell(withReuseIdentifier: "CurrenciesCollectionViewCell", for: indexPath) as! CurrenciesCollectionViewCell
        
        // Set name label
        currencyCell.nameLabel.text = currencies[indexPath.item].name!
        
        // Set image view
        let imageSource = currencies[indexPath.item].image!
        currencyCell.currencyImageView.kf.setImage(with: URL(string: imageSource))
        
        // Set price label
        currencyCell.currentPriceLabel.text = String(currencies[indexPath.item].currentPrice!)
        
        // Set percentage label
        let percentage = currencies[indexPath.item].priceChangePercentage24h!
        currencyCell.percentageLabel.text = "%\(String(format: "%.2f", percentage))"
        
        // Set percentage label color
        percentage >= 0 ? (currencyCell.percentageLabel.textColor = .green) : (currencyCell.percentageLabel.textColor = .red)
        
        return currencyCell
        
    }
    
}

// Collection View
extension CurrenciesCollectionViewHelper {
    
    func createBasicListLayout() -> UICollectionViewLayout {
        let fraction: CGFloat = 1 / 2
        let inset: CGFloat = 2.5
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(fraction), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(fraction))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
        
        return UICollectionViewCompositionalLayout(section: section)
    }
}

