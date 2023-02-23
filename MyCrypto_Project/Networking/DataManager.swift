//
//  DataManager.swift
//  MyCrypto_Project
//
//  Created by Aleksandr Kan on 23/02/23.
//

import Foundation

class Datamanager {
    
    private let networkInstance = NetworkService()
    
    func getModel(for crypto: String, and currency: String) -> Coin {
        var model = Coin()
        networkInstance.getData(for: crypto, and: currency) { result in
            switch result {
            case .success(let result):
                do {
                    let info = try JSONDecoder().decode(JsonStruct.self, from: result)
                    let coin = Coin(crypto: info.baseId, currency: info.quoteId, rate: info.rate, time: info.time)
                    model = coin
                    print(info)
                } catch let error {
                    print("\(error.localizedDescription)")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        return model
    }
    
    
}
