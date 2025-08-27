//
//  AddProductView.swift
//  ScannerBot
//
//  Created by Bjem on 8/27/25.
//

import SwiftUI

struct AddProductView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var price = ""
    @State private var creationDate = Date()
    @State private var isFavorited = false
    
    var onCreate: (Product) -> Void
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                TextField("Price", text: $price)
                    .keyboardType(.decimalPad)
                DatePicker("Creation Date", selection: $creationDate)
                Toggle("Favorited", isOn: $isFavorited)
            }
            .navigationTitle("New Product")
        }
    }
}



