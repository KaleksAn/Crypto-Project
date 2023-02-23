//
//  DataManager.swift
//  MyCrypto_Project
//
//  Created by Aleksandr Kan on 23/02/23.
//

import Foundation

protocol CoinManagerDelegate: AnyObject {
    func updateValues(manager: Datamanager, coin: Coin)
}

class Datamanager {
    
    weak var delegate: CoinManagerDelegate?
    
    private let networkInstance = NetworkService()
    
    func getModel(for crypto: String, and currency: String) -> Coin {
        var model = Coin()
        networkInstance.getData(for: crypto, and: currency) { [weak self] result in
            guard let strongSelf = self else { return }
            
            switch result {
            case .success(let result):
                do {
                    let info = try JSONDecoder().decode(JsonStruct.self, from: result)
                    model = Coin(crypto: info.baseId, currency: info.quoteId, rate: info.rate, time: info.time)
                    strongSelf.delegate?.updateValues(manager: strongSelf, coin: model)
                    //print("MODEL \(model.rate)")
                    //print(info)
                } catch let error {
                    print("\(error.localizedDescription)")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
       //delegate?.updateValues(manager: self)
        return model
    }
    
    
}
