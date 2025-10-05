//
//  ProductsViewModel.swift
//  ProductsDemo
//
//  Created by Bjem on 10/3/25.
//

import Foundation
import SwiftUI

class ProductsViewModel: ObservableObject {
    @Published var productName = ""
    @Published var category = ""
    @Published var qauntity = 0
    @Environment(\.managedObjectContext) var viewContext
    @Environment(\.dismiss) var dismiss
    @Published var selectedCategory: ProductCategory?
    @Published var showingAddCategory = false
    
    func saveNewProduct() {
        let newProduct = Product(context: viewContext)
        newProduct.name = productName
        newProduct.productcategory = selectedCategory
        newProduct.quantity = Int64(Int(qauntity))
        try? viewContext.save()
        dismiss()
    }
}
