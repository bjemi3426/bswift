//
//  Coin.swift
//  CryptoCurrencies
//
//  Created by Bjem on 6/9/25.
//

import Foundation

struct Coin: Codable, Identifiable {
    var id: String
    var name: String
    var symbol: String
    var rank: Int
    var is_new: Bool
    var is_active: Bool
    var type: String
}
