//
//  ContentView.swift
//  SwiftMarketiOS
//
//  Created by Brandon Jemison on 2/18/24.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var ProductsVM = ProductViewModel()
    @ObservedObject var userVM = UserViewModel()
    
    var body: some View {
        VStack {
            NavigationView {
                List {
                    ForEach(userVM.users, id: \.id) { user in
                        HStack {
                            Image(systemName: "person.circle")
                            Text(user.name)
                            NavigationLink(destination: UserProductsDetailedView())
                            {
                                Text("")
                            }
                        }
                        Divider()
                    }
                }.onAppear {
                    userVM.getUser()
                }
                
                .navigationTitle("Swift Market")
                .toolbar {
                    ToolbarItem(placement: .automatic) {
                        Button(action: {
                            // Action to perform when the shopping cart button is tapped
                            print("Shopping cart tapped")
                        }) {
                            Image(systemName: "cart")
                        }
                    }
                }
                
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
