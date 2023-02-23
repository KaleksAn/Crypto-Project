//
//  CoinModel.swift
//  MyCrypto_Project
//
//  Created by Aleksandr Kan on 23/02/23.
//

import Foundation


class Coin {
    
    var time: String
    var crypto: String
    var currency: String
    var rate: Double
    
    init(crypto: String, currency: String, rate: Double, time: String) {
        self.time = time
        self.crypto = crypto
        self.currency = currency
        self.rate = rate
    }
    
    init() {
        time = ""
        crypto = ""
        currency = ""
        rate = 0.0
    }
    
    let assets = [
        ["USD", "EUR", "GBP", "RUB", "CAD", "NZD", "AUD", "CNY", "HKD", "JPY", "BRL", "IDR", "ILS", "INR", "MXN", "NOK", "PLN", "RON", "SEK", "SGD", "ZAR", "KRW"],
        ["BTC", "ETH", "ETC", "USDT", "USDC", "BNB", "BUSD", "XRP", "ADA", "SOL", "DOGE", "DOT", "DAI", "MATIC", "SHIB", "TRX", "AVAX", "LEO", "LTC", "XLM", "BCH"]
    ]
    
}
