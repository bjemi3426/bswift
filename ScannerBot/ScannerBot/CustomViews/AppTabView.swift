//
//  AppTabView.swift
//  ScannerBot
//
//  Created by Bjem on 8/25/25.
//

import SwiftUI

struct AppTabView: View {
    var body: some View {
        ZStack {
            Color.indigo.ignoresSafeArea(.all)
            NavigationView(content: {
                VStack {
                    TabView(content: {
                        HomeScreenView()
                        .tabItem({
                            Image(systemName: "house")
                        })
                        ScanProductView()
                        .tabItem({
                            Image(systemName: "qrcode.viewfinder")
                        })
                        FavoritesView()
                        .tabItem({
                            Image(systemName: "star")
                        })
                        SettingsView()
                        .tabItem({
                            Image(systemName: "questionmark.circle")
                        })
                       
                    }).tint(.indigo)
                }
            })
          
        }

    }
}

struct AppTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabView()
    }
}
