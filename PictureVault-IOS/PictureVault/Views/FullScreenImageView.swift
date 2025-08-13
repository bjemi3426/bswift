//
//  FullScreenImageView.swift
//  PictureVault
//
//  Created by Bjem on 8/13/25.
//

import SwiftUI

struct FullScreenImageView: View {
    @Environment(\.dismiss) var dismiss
    @State private var showShareSheet = false
    let image: UIImage?

    var body: some View {
        VStack {
            VStack(spacing: 10) {
                Button("Back") {
                    dismiss()
                }
                
                Button(action: {
                    showShareSheet.toggle()
                }) {
                    Image(systemName: "square.and.arrow.up.circle")
                        .font(.system(size: 30))
                }
            }
            .sheet(isPresented: $showShareSheet) {
                if let image = image {
                            ShareSheet(activityItems: [image])
                        }
                    }
            Spacer()
            ZStack {
                
                Image(uiImage: image ?? UIImage(systemName: "photo")!)
                    .resizable()
                .padding()
                .edgesIgnoringSafeArea(.all)
                .scaledToFill()
            }
            
            Spacer()
        }
    }
}

