//
//  UserProductsDetailedView.swift
//  SwiftMarketiOS
//
//  Created by Brandon Jemison on 2/19/24.
//

import SwiftUI

struct UserProductsDetailedView: View {
    
    @ObservedObject var productVM = ProductViewModel()
    
    var body: some View {
        List {
            ForEach(productVM.products, id: \.id) { product in
                HStack {
                    Image(systemName: "cart")
                    VStack {
                        Text(product.name).font(.subheadline)
                        Text(product.description).bold()
                        Text("\(product.price)").italic()
                    }
                }
                Divider()
            }
       
        }.onAppear {
            productVM.getProducts()
        }
    }
}

#Preview {
    UserProductsDetailedView()
}
