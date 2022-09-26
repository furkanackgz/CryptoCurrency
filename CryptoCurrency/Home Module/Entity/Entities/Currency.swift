//
//  Currency.swift
//  CryptoCurrency
//
//  Created by Furkan Açıkgöz on 17.09.2022.
//

import Foundation

struct Currency: Codable {
    var id: String?
    var symbol: String?
    var name: String?
    var image: String?
    var currentPrice: Double?
    var marketCap: Double?
    var marketCapRank: Int?
    var fullyDilutedValuation: Double?
    var totalVolume: Double?
    var high24h: Double?
    var low24h: Double?
    var priceChange24h: Double?
    var priceChangePercentage24h: Double?
    var marketCapChange24h: Double?
    var marketCapChangePercentage24h: Double?
    var circulatingSupply: Double?
    var totalSupply: Double?
    var maxSupply: Double?
    var ath: Double?
    var athChangePercentage: Double?
    var athDate: String?
    var atl: Double?
    var atlChangePercentage: Double?
    var atlDate: String?
    var roi: Roi?
    var lastUpdated: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case symbol
        case name
        case image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24h = "high_24h"
        case low24h = "low_24h"
        case priceChange24h = "price_change_24h"
        case priceChangePercentage24h = "price_change_percentage_24h"
        case marketCapChange24h = "market_cap_change_24h"
        case marketCapChangePercentage24h = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case roi
        case lastUpdated = "last_updated"
    }
    
    
}

struct Roi: Codable {
    var times: Double?
    var currency: String?
    var percentage: Double?
}
