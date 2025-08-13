//
//  PhotoDetailView.swift
//  SmartyPlants
//
//  Created by Bjem on 7/15/25.
//

import SwiftUI

struct PhotoDetailView: View {
    let columns = Array(repeating: GridItem(.flexible()), count: 4)
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(0..<16) { index in
                Rectangle()
                    .fill(Color.secondary)
                    .frame(height: 80)
                    .padding(.top)
                    .overlay(
                        Text("\(index + 1)")
                            .foregroundColor(.white)
                            .font(.headline)
                    )
                    .cornerRadius(8)
            }
        }
        .frame(minWidth: 900, minHeight: 400)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Done") {
                    dismiss()
                }
            }
        }
    }
}

struct PhotoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoDetailView()
    }
}
