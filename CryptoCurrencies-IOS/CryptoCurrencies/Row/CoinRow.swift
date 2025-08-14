
import Foundation
import SwiftUI

struct CoinRow: View {
    let coin: Coin
    var body: some View {
        VStack {
            Text(coin.name)
            Text(coin.symbol)
            Text(coin.type)
        }
    }
}

