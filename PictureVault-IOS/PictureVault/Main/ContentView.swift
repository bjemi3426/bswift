//
//  ContentView.swift
//  PictureVault
//
//  Created by Bjem on 8/13/25.
//

import SwiftUI



struct ContentView: View {
    @ObservedObject var contentData = ContentDataViewModel()
    @Environment(\.presentationMode) var presentation
    
    var imagePicker: ImagePicker!
    
    init() {
        imagePicker = ImagePicker(openImagePicker: self.$contentData.openimagePicker, picture: self.$contentData.picture)
    }
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.indigo, .gray]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()

                VStack {
                    NavigationLink(destination: imagePicker, label: {
                        Image(systemName: "plus")
                        Text("New Photo").bold().padding(.leading)
                    })
                    .foregroundColor(.black)
                    .offset(x: -150)
                    List {
                    ForEach(0 ..< 23) { _ in
                        PhotoRow(contentData: contentData)
                    }
                }
                    .listStyle(.automatic)
                    .cornerRadius(20)
                    .padding()
                    .background(Color.clear)
                    
                }
                .navigationTitle("Picture Vault")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


