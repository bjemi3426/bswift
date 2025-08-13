

import SwiftUI

struct CustomToolBar: ToolbarContent {
    @Binding var selectedScreen: ToolbarSelection?
    
    
    var body: some ToolbarContent {
        ToolbarItemGroup(placement: .bottomBar) {
            Button(action: {
                selectedScreen = .first
            }) {
                VStack {
                    Image(systemName: "house.circle.fill")
                        .resizable()
                        .frame(width: 38, height: 38)
                     

                }.padding(.top)
           
            }.padding(.bottom, 10)
            Spacer()
            Button(action: {
                selectedScreen = .second
            }) {
                VStack {
                    Image(systemName: "magnifyingglass.circle.fill")
                        .resizable()
                        .frame(width: 38, height: 38).padding(.top)
                }
            }.padding(.bottom, 10)
            Spacer()
            Button(action: {
                selectedScreen = .third
            }) {
                VStack {
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 38, height: 38).padding(.top)
                }
            }.padding(.bottom, 10)
               
            
        }
    }
}


