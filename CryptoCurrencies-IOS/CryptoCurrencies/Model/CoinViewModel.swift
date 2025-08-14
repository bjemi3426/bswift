//
//  CoinViewModel.swift
//  CryptoCurrencies
//
//  Created by Bjem on 6/9/25.
//

import Foundation


class CoinViewModel: ObservableObject {
 
    @Published var coins = [Coin]()
    
    
    func fetchCoins() {
        print("Starting fetch")
        let fetchedCoins = Bundle.main.decode([Coin].self, from: "coins.json")
        guard fetchedCoins.isEmpty else {
            print("Not able to fetch coins")
            return
        }
            
        
        self.coins = fetchedCoins
    }
    

    
}
