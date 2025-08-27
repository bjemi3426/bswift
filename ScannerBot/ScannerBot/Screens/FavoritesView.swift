//
//  FavoritesView.swift
//  ScannerBot
//
//  Created by Bjem on 8/25/25.
//

import SwiftUI

struct FavoritesView: View {
    @ObservedObject var productsVM = ProductsViewModel()
    
    
    
    
    var body: some View {
        List(productsVM.products.filter({
            $0.isFavorited == true
        }), id: \.id) { product in
            Text(product.name)
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
