//
//  ContentView.swift
//  ProductsDemo
//

import SwiftUI
import CoreData

struct ContentView: View {
    @ObservedObject var contentViewModel = ContentViewModel()
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Product.timestamp, ascending: true)],
        animation: .default
    ) private var products: FetchedResults<Product>
    
    var body: some View {
        NavigationView {
            TabView(selection: $contentViewModel.selectedView) {
                ZStack {
                    Color("AppBackground").ignoresSafeArea()
                    VStack(spacing: 24) {

                        statsHeader

                        productListView

                        categoryBreakdown
                    }
                    .padding(.top, 12)
                    .padding(.horizontal)
                }
                .tabItem {
                    Image(systemName: "cart")
                    Text("Products")
                }
                .tag(0)
                
                CameraView()
                    .tabItem {
                        Image(systemName: "camera")
                        Text("Camera")
                    }
                    .tag(1)
                
                FavoritesView()
                    .tabItem {
                        Image(systemName: "star")
                        Text("Favorites")
                    }
                    .tag(2)
                
                SettingsView()
                    .tabItem {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
                    .tag(3)
            }
            .navigationTitle(contentViewModel.tabTitle)
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $contentViewModel.addProductTapped) {
                AddProductView()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    if contentViewModel.selectedView == 0 {
                        Button(action: { contentViewModel.addProductTapped.toggle() }) {
                            Label("Add Product", systemImage: "plus")
                                .foregroundColor(Color("AppAccent"))
                        }
                    }
                }
                ToolbarItem(placement: .automatic) {
                    if contentViewModel.selectedView == 0 {
                        Button {
                            contentViewModel.showChart.toggle()
                        } label: {
                            Label(contentViewModel.showChart ? "Show Cards" : "Show Chart",
                                  systemImage: contentViewModel.showChart ? "square.grid.2x2" : "chart.bar")
                                .foregroundColor(Color("AppPrimary"))
                        }
                    }
                }
            }
        }
    }
    

    private var statsHeader: some View {
        HStack(spacing: 24) {
            VStack {
                Text("\(products.count)")
                    .font(.largeTitle.bold())
                    .foregroundColor(Color("AppPrimary"))
                Text("Total Products")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            VStack {
                Text("\(uniqueCategories.count)")
                    .font(.largeTitle.bold())
                    .foregroundColor(Color("AppSecondary"))
                Text("Categories")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color("AppSurface"))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
    
    private var productListView: some View {
        VStack(alignment: .leading, spacing: 16) {
            if products.isEmpty {
                Text("No products yet")
                    .font(.headline)
                    .foregroundStyle(.secondary)
                    .padding()
            } else if contentViewModel.showChart {
                ProductChartView(products: products)
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(products) { product in
                            ProductCardView(product: product)
                                .contextMenu {
                                    Button(role: .destructive) {
                                        contentViewModel.deleteProduct(product)
                                    } label: {
                                        Label("Delete", systemImage: "trash")
                                    }
                                }
                        }
                    }
                    .padding(.horizontal, 8)
                }
            }
        }
    }

    private var categoryBreakdown: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Categories")
                .font(.headline)
                .padding(.leading, 4)
            
            ForEach(uniqueCategories, id: \.self) { category in
                let count = products.filter { $0.productcategory?.name == category }.count
                HStack {
                    Label(category, systemImage: "tag")
                        .foregroundColor(Color("AppPrimary"))
                    Spacer()
                    Text("\(count)")
                        .font(.headline)
                        .foregroundColor(Color("AppSecondary"))
                }
                .padding()
                .background(Color("AppSurface"))
                .cornerRadius(12)
                .shadow(color: .black.opacity(0.05), radius: 3, x: 0, y: 2)
            }
        }
        .padding(.top, 8)
    }
    
    private var uniqueCategories: [String] {
        let names = products.compactMap { $0.productcategory?.name }
        return Array(Set(names)).sorted()
    }
}

