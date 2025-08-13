//
//  CatListRow.swift
//  Star Wars Cats
//
//  Created by Brandon Jemison on 12/19/21.
//

import SwiftUI

struct CatListRow: View {
    
    @State var cat: Cat?
    @Binding var isGrayscaledEnabled: Bool
    @State var grayscaleImage = "https://picsum.photos/200/300?grayscale"
    
    var body: some View {
        
        AsyncImage(
            url: URL(string: (isGrayscaledEnabled ? grayscaleImage : cat?.image)!),
            transaction: Transaction(animation: .easeInOut)
        ) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .transition(.scale(scale: 0.1, anchor: .center))
            case .failure:
                Image(systemName: "wifi.slash")
            @unknown default:
                EmptyView()
            }
        }
    }
}

struct CatListRow_Previews: PreviewProvider {
    @State static var bool: Bool = false
    static var previews: some View {
        CatListRow(isGrayscaledEnabled: $bool)
    }
}
