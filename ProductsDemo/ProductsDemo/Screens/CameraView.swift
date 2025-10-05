//
//  CameraView.swift
//  ProductsDemo
//
//  Created by Bjem on 10/3/25.
//

import SwiftUI

struct CameraView: View {
    @State private var openImagePicker = false
    @State private var picture: UIImage?
    
    var body: some View {
        VStack {
            if let picture = picture {
                Image(uiImage: picture)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    .cornerRadius(12)
            } else {
                Text("No photo selected")
                    .foregroundColor(.secondary)
            }
            
            Button("Open Camera") {
                openImagePicker = true
            }
            .padding()
        }
        .sheet(isPresented: $openImagePicker) {
            ImagePicker(openImagePicker: $openImagePicker, picture: $picture)
        }
    }
}


struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
