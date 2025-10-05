//
//  FavoritesView.swift
//  ProductsDemo
//
//  Created by Bjem on 10/3/25.
//

import SwiftUI

enum PlantFilter: String, CaseIterable {
    case all = "All Plants"
    case favorites = "Favorites"
}

struct FavoritesView: View {
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Product.timestamp, ascending: true)],
        animation: .default
    ) private var products: FetchedResults<Product>
    @State private var filter: PlantFilter = .all
    var uniquePlants: [Product] {
            var seen = Set<String>()
            return products.filter { product in
                
                guard let name = product.name else { return false }
                
                return seen.insert(name).inserted
            }
        }
        
        var filteredPlants: [Product] {
            uniquePlants.filter { product in
                    return product.isFavorited
                
            }
        }
    
    var body: some View {
        
        if filteredPlants.isEmpty {
            Text("No favorited added")
        } else {
            List {
                ForEach(uniquePlants, id: \.id) { product in
                    ProductCardView(product: product)
                }
            }
        }
        
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
