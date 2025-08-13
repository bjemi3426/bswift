//
//  CatDetailedView.swift
//  Star Wars Cats
//
//  Created by Brandon Jemison on 12/19/21.
//

import SwiftUI

struct CatDetailedView: View {
    
    @State var cat: Cat
    @State var isGrayscaledEnabled: Bool
    
    
    var body: some View {
        VStack(spacing: 10) {
            CatImage(cat: cat, isGrayscaledEnabled: $isGrayscaledEnabled).modifier(ImageModifier(width: 200, height: 200))
            Text(cat.name)
            
            AttributesView(cat: cat)
        }
        .toolbar {
            ShareButton(cat: cat)
        }
    }
}

struct CatDetailedView_Previews: PreviewProvider {
    @State static var cat: Cat = Cat(name: "Whiskers", height: "178", mass: "79", hairColor: "green", skinColor: "brown", eyeColor: "red", birthYear: "unknown", gender: "unknown", image: "")
    @State static var isGrayscaledEnabled: Bool = false
    static var previews: some View {
        CatDetailedView(cat: cat, isGrayscaledEnabled: isGrayscaledEnabled).environmentObject(Network())
    }
}


struct CatImage: View {
    
    @State var cat: Cat
    @Binding var isGrayscaledEnabled: Bool
    @State var grayscaleImage = "https://picsum.photos/200/300?grayscale"
    
    var body: some View {
        AsyncImage(
            url: URL(string: (isGrayscaledEnabled ? grayscaleImage : cat.image)),
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


struct ShareButton: View {
    
    @State var cat: Cat
    
    var body: some View {
        Button(action: shareButton) {
            Image(systemName: "square.and.arrow.up")
        }
    }
    
    func shareButton() {
        
        let url = cat.image
        
        let  imageURL = URL(string: url)
        
        let data = try! Data(contentsOf: imageURL!)
        
        let image = UIImage(data: data )
        
        let activityController = UIActivityViewController(activityItems: [image!], applicationActivities: nil)
        
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        _ = windowScene?.windows.first?.rootViewController!.present(activityController, animated: true, completion: nil)
    }
}


struct AttributeRow: View {
    
    @State var attributeTitle: String?
    @State var attributeName: String
    
    var body: some View {
        Divider().background(Color.gray)
        HStack {
            Text(attributeTitle ?? "").padding(.leading)
            Text(attributeName)
            Spacer()
        }
    }
}


struct AttributesView: View {
    
    @State var cat: Cat
    
    var body: some View {
        Group {
            AttributeRow(attributeTitle: "Birth Year: ", attributeName: cat.birthYear ?? "n/a")
            AttributeRow(attributeTitle: "Mass: ", attributeName: cat.mass ?? "n/a")
            AttributeRow(attributeTitle: "Height: ", attributeName: cat.height ?? "n/a")
            AttributeRow(attributeTitle: "Skin Color: ", attributeName: cat.skinColor ?? "n/a")
            AttributeRow(attributeTitle: "Gender: ", attributeName: cat.gender ?? "n/a")
            AttributeRow(attributeTitle: "Hair Color: ", attributeName: cat.hairColor ?? "n/a")
            AttributeRow(attributeTitle: "Eye Color: ", attributeName: cat.eyeColor ?? "n/a")
            Divider().background(Color.gray)
            Spacer(minLength: 30)
        }
        .font(Font.system(.headline))
    }
}
