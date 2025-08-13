//
//  ContentView.swift
//  Star Wars Cats
//
//  Created by Brandon Jemison on 12/19/21.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var network: Network
    @State var searchText = ""
    @State var isGrayscaledEnabled: Bool = false
    
    var body: some View {
        NavigationView {
            List(catSearchResults.sorted(by: { $0.name < $1.name }), id: \.self) { cat in
                HStack {
                    CatListRow(cat: cat, isGrayscaledEnabled: $isGrayscaledEnabled).modifier(ImageModifier(width: 84, height: 84))
                    Text(cat.name)
                    NavigationLink(destination: CatDetailedView(cat: cat, isGrayscaledEnabled: isGrayscaledEnabled)
                    ) {
                        Text("")
                    }
                }
            }
            .onAppear {
                network.getCats()
            }
            .navigationBarTitle("Star Wars Cats")
            .navigationBarItems(trailing: Toggle(isGrayscaledEnabled ? "Disable Grascale" : "Enable Grayscale", isOn: $isGrayscaledEnabled))
            .searchable(text: $searchText)
        }
    }
    
    var catSearchResults: [Cat] {
        if searchText.isEmpty {
            return network.cats
        } else {
            return network.cats.filter { $0.name.contains(searchText) }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Network())
    }
}


struct ImageModifier: ViewModifier {
    
    @State var width: CGFloat
    @State var height: CGFloat
    
    func body(content: Content) -> some View {
        return content
            .frame(width: width, height: height)
            .background(Color.gray)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 10, x:1, y:1 )
            .background(Color.gray)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 10, x:1, y:1 )
    }
}
