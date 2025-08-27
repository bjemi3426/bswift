//
//  HomeScreenView.swift
//  ScannerBot
//
//  Created by Bjem on 8/24/25.
//

import SwiftUI

struct HomeScreenView: View {
    @ObservedObject var productsVM = ProductsViewModel()
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            HStack {
                Text("Recent Products")
                    .padding()
                Button(action: {
                    productsVM.addnewProductTapped.toggle()
                }) {
                    Text("Add Product")
                    Image(systemName: "plus")
                }
                .sheet(isPresented: $productsVM.addnewProductTapped, content: {
                    AddProductView { _ in
                        //Do anything I want with Product here. Append to products Array
                    }
                    Button(action: {
                        dismiss()
                    }) {
                        Text("Done")
                    }
                })
            }
      
            List(productsVM.products, id: \.id)  { product in
                HStack {
                    Text(product.name).bold()
                    Text("$\(product.price.formatted())").fontWeight(.semibold)
                }
            }
        }
    }
}

