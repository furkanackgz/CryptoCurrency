//
//  CurrencyTableViewCell.swift
//  CryptoCurrency
//
//  Created by Furkan Açıkgöz on 25.09.2022.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var symbolImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var percentageLabel: UILabel!
    @IBOutlet weak var priceKeyLabel: UILabel!
    @IBOutlet weak var priceValueLabel: UILabel!
    @IBOutlet weak var high24hKeyLabel: UILabel!
    @IBOutlet weak var high24hValueLabel: UILabel!
    @IBOutlet weak var low24hKeyLabel: UILabel!
    @IBOutlet weak var low24hValueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension CurrencyTableViewCell {
    
    private func setupUI() {
            
        // Set content view
        contentView.backgroundColor = .clear
        
        // Set container view
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 8
        
        // Set image view
        symbolImageView.layer.cornerRadius = symbolImageView.frame.height / 2
        
    }
    
}
