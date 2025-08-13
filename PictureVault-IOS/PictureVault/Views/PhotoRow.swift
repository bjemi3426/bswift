//
//  PhotoRow.swift
//  PictureVault
//
//  Created by Bjem on 8/13/25.
//

import SwiftUI

struct PhotoRow: View {
    @ObservedObject var contentData: ContentDataViewModel
    
    var body: some View {
        HStack {
            Button(action: {
                
            }) {
                Image(systemName: "trash")
            }
            .foregroundColor(.accentColor)
            
            VStack {
                Image(uiImage: ((contentData.picture ?? UIImage(systemName: "photo"))!))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 80, height: 80), style: .circular))
                    .padding(.leading)
                    .onTapGesture {
                        contentData.openimagePicker.toggle()
                    }
            }
            .fullScreenCover(isPresented: $contentData.openimagePicker) {
                FullScreenImageView(image: contentData.picture)
            }
        }
        
    }
}


