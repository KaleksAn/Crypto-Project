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
    
    let assets = [ CurrencyValue.allValues, CryptoValue.allValues ]
    
}


//MARK: - Enums Value
  fileprivate  enum CurrencyValue: String, CaseIterable {
        case USD, EUR, KRW, RUB, JPY
      
      static var allValues: [String] {
          return CurrencyValue.allCases.map { $0.rawValue }
      }
    }

fileprivate  enum CryptoValue: String, CaseIterable {
    case BTC, ETH, ETC, USDT, USDC, BNB, BUSD, XRP, ADA, SOL, DOGE, DOT, DAI, MATIC, SHIB, TRX, AVAX, LEO, LTC, XLM, BCH
    
    static var allValues: [String] {
        return CryptoValue.allCases.map { $0.rawValue
        }
    }
}
