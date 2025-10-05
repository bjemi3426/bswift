//
//  ProductCardView.swift
//  ProductsDemo
//
//  Created by Bjem on 10/4/25.
//

import SwiftUI

struct ProductCardView: View {
    var product: Product
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.blue.opacity(0.2))
                .frame(width: 150, height: 100)
                .overlay(
                    Image(systemName: "cart.fill")
                        .font(.largeTitle)
                        .foregroundColor(.indigo)
                )
            Text(product.name ?? "n/a")
            Text("\(product.quantity)")
            Text(product.timestamp ?? Date(), formatter: productFormatter)
                .font(.headline)
                .lineLimit(1)
            
            if let category = product.productcategory {
                HStack {
                    Text(category.name ?? "n/a")
                        .font(.subheadline)
                    .foregroundStyle(.secondary)
                    
                    Button(action: {
                        product.isFavorited.toggle()
                    }) {
                        Image(systemName: "star.circle.fill")
                            .foregroundColor(product.isFavorited ? Color.appPrimary : Color.white )
                    }
                }
            }
            
        }
        .padding(8)
        .frame(width: 160)
        .background(.ultraThinMaterial)
        .background(Color.appSecondary)
        .cornerRadius(16)
        .shadow(radius: 2)
    }
    
    private let productFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
}


