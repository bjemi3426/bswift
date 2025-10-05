//
//  AddProductView.swift
//  ProductsDemo
//
//  Created by Bjem on 10/3/25.
//

import SwiftUI

struct AddProductView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var productsVM = ProductsViewModel()
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \ProductCategory.name, ascending: true)],
        animation: .default)
    private var categories: FetchedResults<ProductCategory>
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {

                    VStack(spacing: 16) {
                        HStack {
                            Image(systemName: "cart.fill")
                                .foregroundColor(Color("AppPrimary"))
                            TextField("Enter product name", text: $productsVM.productName)
                                .textFieldStyle(.plain)
                                .padding(10)
                                .background(Color("AppSurface").opacity(0.6))
                                .cornerRadius(10)
                        }
                        
                        Stepper(value: $productsVM.qauntity, in: 0...100) {
                            HStack {
                                Image(systemName: "number.circle")
                                    .foregroundColor(Color("AppSecondary"))
                                Text("Quantity: \(productsVM.qauntity)")
                                    .bold()
                            }
                        }
                    }
                    .padding()
                    .background(Color("AppSurface"))
                    .cornerRadius(16)
                    .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)

                    VStack(alignment: .leading, spacing: 12) {
                        Text("Category")
                            .font(.headline)
                            .foregroundColor(Color("AppPrimary"))
                        
                        Picker("Category", selection: $productsVM.selectedCategory) {
                            ForEach(categories, id: \.objectID) { category in
                                Text(category.name ?? "Unnamed")
                                    .tag(category as ProductCategory?)
                            }
                            Text("➕ Add Category…")
                                .tag(nil as ProductCategory?)
                        }
                        .pickerStyle(.menu)
                        .onChange(of: productsVM.selectedCategory) { newValue in
                            if newValue == nil {
                                productsVM.showingAddCategory = true
                            }
                        }
                    }
                    .padding()
                    .background(Color("AppSurface"))
                    .cornerRadius(16)
                    .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
                    
                    Spacer()
                }
                .padding()
            }
            .background(Color("AppBackground").ignoresSafeArea())
            .navigationTitle("Add Product")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                        .foregroundColor(Color("AppSecondary"))
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        productsVM.saveNewProduct()
                    }
                    .disabled(productsVM.productName.isEmpty)
                    .foregroundColor(productsVM.productName.isEmpty ? .gray : Color("AppAccent"))
                }
            }
            .sheet(isPresented: $productsVM.showingAddCategory) {
                AddCategoryView()
            }
        }
    }
}


