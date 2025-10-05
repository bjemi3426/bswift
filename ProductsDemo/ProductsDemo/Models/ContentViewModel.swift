//
//  ContentViewModel.swift
//  ProductsDemo
//
//  Created by Bjem on 10/4/25.
//

import Foundation
import SwiftUI


class ContentViewModel: ObservableObject {
    @Published var addProductTapped = false
    @Environment(\.managedObjectContext) var viewContext
    @AppStorage("isLoggedIn") var isLoggedIn = false
    @Published var showChart = false
    @Published var selectedView = 0
    var tabTitle: String {
        switch selectedView {
        case 0: return "Products"
        case 1: return "Camera"
        case 2: return "Favorites"
        case 3: return "Settings"
        default: return "Products"
        }
    }
    func deleteProduct(_ product: Product) {
        withAnimation {
            viewContext.delete(product)
            do {
                try viewContext.save()
            } catch {
                print("Error deleting product: \(error)")
            }
        }
    }
}
