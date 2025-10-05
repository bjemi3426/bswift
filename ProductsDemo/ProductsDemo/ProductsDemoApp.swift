//
//  ProductsDemoApp.swift
//  ProductsDemo
//
//  Created by Bjem on 10/3/25.
//

import SwiftUI

@main
struct ProductsDemoApp: App {
    
    init() {
            // Force logout on each app launch
            UserDefaults.standard.set(false, forKey: "isLoggedIn")
        }
    
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                ContentView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            } else {
                UserLoginView(loginButtonTapped: $isLoggedIn)
            }
            
        }
    }
}
