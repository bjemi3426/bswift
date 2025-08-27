//
//  ProductsViewModel.swift
//  ScannerBot
//
//  Created by Bjem on 8/25/25.
//

import Foundation

struct Product {
    var id = UUID()
    var name: String
    var price: Double
    var creationDate: Date
    var isFavorited: Bool
}

class ProductsViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var addnewProductTapped = false
    init() {
        let defaultProduct = Product(name: "Book", price: 3.99, creationDate: Date.now, isFavorited: true)
        self.products.append(defaultProduct)
    }
    
}
