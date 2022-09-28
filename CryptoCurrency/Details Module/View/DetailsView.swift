//
//  DetailsView.swift
//  CryptoCurrency
//
//  Created by Furkan Açıkgöz on 27.09.2022.
//

import UIKit
import Charts
import Kingfisher

class DetailsView: UIViewController, DetailsContract.detailsView {
    // MARK: - Features
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var currencyImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var chartView: LineChartView!
    @IBOutlet weak var currentPriceValueLabel: UILabel!
    @IBOutlet weak var marketCapValueLabel: UILabel!
    @IBOutlet weak var marketCapRankValueLabel: UILabel!
    @IBOutlet weak var fullyDilutedValuationValueLabel: UILabel!
    @IBOutlet weak var totalVolumeValueLabel: UILabel!
    @IBOutlet weak var high24hValueLabel: UILabel!
    @IBOutlet weak var low24hValueLabel: UILabel!
    @IBOutlet weak var priceChange24hValueLabel: UILabel!
    @IBOutlet weak var priceChangePercentage24hValueLabel: UILabel!
    @IBOutlet weak var marketCapChange24hValueLabel: UILabel!
    @IBOutlet weak var marketCapChangePercentage24hValueLabel: UILabel!
    @IBOutlet weak var circulatingSupplyValueLabel: UILabel!
    @IBOutlet weak var totalSupplyValueLabel: UILabel!
    @IBOutlet weak var maxSupplyValueLabel: UILabel!
    @IBOutlet weak var athValueLabel: UILabel!
    @IBOutlet weak var athChangePercentageValueLabel: UILabel!
    @IBOutlet weak var athDateValueLabel: UILabel!
    @IBOutlet weak var atlValueLabel: UILabel!
    @IBOutlet weak var atlChangePercentageValueLabel: UILabel!
    @IBOutlet weak var atlDateValueLabel: UILabel!
    
    var detailsPresenter: DetailsContract.detailsPresenter?
    
    private var isCurrencySaved: Bool?
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        detailsPresenter?.viewDidLoad()
    }

}

// Self related
extension DetailsView {
    
    /**
     Sets background color as gradient.
     */
    // MARK: - setBackgroundColor
    private func setBackgroundColor() {
        
        let colorTop = ThemeManager.colors.backgroundColor!
        let colorBottom = UIColor.black
        
        let gl = CAGradientLayer()
        
        gl.frame = view.bounds
        gl.colors = [colorTop.cgColor, colorBottom.cgColor]
        view.layer.insertSublayer(gl, at: 0)
        containerView.backgroundColor = .clear
        
    }
    
    // MARK: - setNavigationBar
    private func setNavigationBar(id: String) {
        
        // Set navigation bar back button
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.topItem?.backButtonDisplayMode = .minimal
        
        // Create navigation title's attributes
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.init(name: "Marker Felt", size: 26)!,
            .foregroundColor: UIColor.white
        ]
        
        // Create navigation bar's appearance
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .clear
        appearance.titleTextAttributes = attributes
        
        // Set navigation bar appearance
        navigationController?.navigationBar.standardAppearance = appearance
        
        // Set navigation bar title
        
        title = "\(id)".uppercased()
        
        // Set navigation bar button
        if isCurrencySaved! {
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Remove",
                                                               style: .done,
                                                               target: self,
                                                               action: #selector(didPressBarButton))
        } else {
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add",
                                                               style: .done,
                                                               target: self,
                                                               action: #selector(didPressBarButton))
        }
        
    }
    
    // MARK: - setChartView
    private func setChartView(with chartData: LineChartData) {
        chartView.data = chartData
        chartView.xAxis.labelTextColor = .clear
        chartView.rightAxis.enabled = false
        chartView.leftYAxisRenderer.axis.labelTextColor = .white
        chartView.legend.setCustom(entries: [.init(label: "Current Price")])
        chartView.legend.textColor = .white
        chartView.legend.drawInside = true
        chartView.legend.horizontalAlignment = .left
        chartView.legend.verticalAlignment = .top
        chartView.legend.font = UIFont.init(name: "Marker Felt", size: 16)!
    }
    
    // MARK: - setLabels
    private func setLabels(with selectedCurrency: Currency) {
        // Set name label
        nameLabel.text = selectedCurrency.name ?? "-"
        
        // Set symbol label
        symbolLabel.text = selectedCurrency.symbol ?? "-"
        
        // Set current price label
        currentPriceValueLabel.text = String(selectedCurrency.currentPrice ?? 0)
        
        // Set market cap label
        marketCapValueLabel.text = String(selectedCurrency.marketCap ?? 0)
        
        // Set market cap rank label
        marketCapRankValueLabel.text = String(selectedCurrency.marketCapRank ?? 0)
        
        // Set fully diluted valuation label
        fullyDilutedValuationValueLabel.text = String(selectedCurrency.fullyDilutedValuation ?? 0)
        
        // Set total volume label
        totalVolumeValueLabel.text = String(selectedCurrency.totalVolume ?? 0)
        
        // Set high 24h label
        high24hValueLabel.text = String(selectedCurrency.high24h ?? 0)
        
        // Set low 24h label
        low24hValueLabel.text = String(selectedCurrency.low24h ?? 0)
        
        // Set price change 24h label
        priceChange24hValueLabel.text = String(selectedCurrency.priceChange24h ?? 0)
        
        // Set price change percentage 24h label
        priceChangePercentage24hValueLabel.text = String(selectedCurrency.priceChangePercentage24h ?? 0)
        
        // Set market cap change 24h label
        marketCapChange24hValueLabel.text = String(selectedCurrency.marketCapChange24h ?? 0)
        
        // Set marketCapChangePercentage24h
        marketCapChangePercentage24hValueLabel.text = String(selectedCurrency.marketCapChangePercentage24h ?? 0)
        
        // Set circulating supply label
        circulatingSupplyValueLabel.text = String(selectedCurrency.circulatingSupply ?? 0)
        
        // Set total supply label
        totalSupplyValueLabel.text = String(selectedCurrency.totalSupply ?? 0)
        
        // Set max supply label
        maxSupplyValueLabel.text = String(selectedCurrency.maxSupply ?? 0)
        
        // Set ath label
        athValueLabel.text = String(selectedCurrency.ath ?? 0)
        
        // Set ath change percentage label
        athChangePercentageValueLabel.text = String(selectedCurrency.athChangePercentage ?? 0)
        
        // Set ath date label
        let athDate = arrangeDateLabels(date: selectedCurrency.athDate ?? "-")
        athDateValueLabel.text = athDate
        
        // Set atl label
        atlValueLabel.text = String(selectedCurrency.atl ?? 0)
        
        // Set atl change percentage
        atlChangePercentageValueLabel.text = String(selectedCurrency.atlChangePercentage ?? 0)
        
        // Set atl date label
        let atlDate = arrangeDateLabels(date: selectedCurrency.atlDate ?? "-")
        atlDateValueLabel.text = atlDate
    }
    
    // MARK: - arrangeDateLabels
    private func arrangeDateLabels(date: String) -> String {
        
        var arrangedDate = date
        
        // Get the index of first 10 letters
        let versionIndex = arrangedDate.index(arrangedDate.startIndex, offsetBy: 10)
        
        // Remove the letters of first 10 index
        arrangedDate.removeSubrange(versionIndex...)
        
        return arrangedDate
        
    }
    
}

// Presenter related
extension DetailsView {
    
    // MARK: - setupUI
    func setupUI(selectedCurrency: Currency,
                 isCurrencySaved: Bool,
                 chartData: LineChartData) {
        
        // Set background color
        setBackgroundColor()
        
        // Set is currency saved variable
        self.isCurrencySaved = isCurrencySaved
        
        // Set navigation bar
        setNavigationBar(id: selectedCurrency.id!)
        
        // Set image view
        let imageSource = selectedCurrency.image!
        currencyImageView.kf.setImage(with: URL(string: imageSource))
        
        // Set chart view
        setChartView(with: chartData)
        
        // Set labels
        setLabels(with: selectedCurrency)
        
    }
    
    // MARK: - displayAlert
    func displayAlert(title: String, message: String) {
        let alert = AlertView(titleString: title, messageString: message)
        alert.modalPresentationStyle = .overCurrentContext
        alert.delegate = self
        self.present(alert, animated: false)
    }
    
}

// MARK: -
extension DetailsView: AlertViewDelegate {
    
    func didPressOkayButton() {
        
        guard let presentedVC = navigationController?.presentedViewController else { return }
        
        // Animate dismissing alert view from the screen
        UIView.animate(withDuration: 0.5) {
            presentedVC.view.alpha = 0
        } completion: { [weak self] done in
            if done {
                self?.dismiss(animated: true)
                self?.detailsPresenter?.didPressAlertButton()
            }
        }

    }
    
}

// @objc methods
extension DetailsView {
    
    // MARK: - didPressBarButton
    @objc private func didPressBarButton() {
        if isCurrencySaved! {
            detailsPresenter?.didPressBarButton(of: "Remove")
        } else {
            detailsPresenter?.didPressBarButton(of: "Add")
        }
    }
    
}
