//
//  JsonStruct.swift
//  MyCrypto_Project
//
//  Created by Aleksandr Kan on 23/02/23.
//

import Foundation

struct JsonStruct: Codable {
    
    var time: String
    var baseId: String
    var quoteId: String
    var rate: Double
    
    enum CodingKeys: String, CodingKey {
        case time
        case baseId = "asset_id_base"
        case quoteId = "asset_id_quote"
        case rate
    }
}
