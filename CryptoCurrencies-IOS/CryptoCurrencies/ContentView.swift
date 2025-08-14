//
//  ContentView.swift
//  CryptoCurrencies
//
//  Created by Bjem on 6/9/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var coinVM = CoinViewModel()
    var body: some View {
        VStack {
            Text("Crypto")
            List {
                ForEach(coinVM.coins) { coin in
                    CoinRow(coin: coin)
                }
            }
            .onAppear {
                coinVM.fetchCoins()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
