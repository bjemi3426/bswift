//
//  ProductChartView.swift
//  ProductsDemo
//
//  Created by Bjem on 10/3/25.
//

import SwiftUI

import Charts

struct ProductChartView: View {
    var products: FetchedResults<Product>
    
    var body: some View {
        Chart {
            ForEach(products) { product in
                BarMark(
                    x: .value("Product", product.name ?? "Untitled"),
                    y: .value("Added", product.quantity)
                )
            }
        }
        .frame(height: 300)
        .padding(8)
    }
}

