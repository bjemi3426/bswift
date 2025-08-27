//
//  ContentView.swift
//  ScannerBot
//
//  Created by Bjem on 8/24/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var homeVM = HomeViewModel()
    var body: some View {
        VStack {
            SignInView(navigateToHome: $homeVM.navigateToHome)
        }
        .fullScreenCover(isPresented: $homeVM.navigateToHome, content: {
            AppTabView()
        })
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
