//
//  NetworkService.swift
//  MyCrypto_Project
//
//  Created by Aleksandr Kan on 23/02/23.
//

import Foundation

class NetworkService {
    private let link = "https://rest.coinapi.io/v1/exchangerate/"
   // private let token = "B3340E2B-CFC5-4D45-B298-087DBA9F9590"
    let token = "6EACA1B7-903D-4D6F-A14B-417C7D4396D7"
    
    func getData(for crypto: String, and currency: String, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: "\(link)\(crypto)/\(currency)?apikey=\(token)") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error { completion(.failure(error)) }
                if let data = data { completion(.success(data)) }
            }
        }.resume()
    }
}
