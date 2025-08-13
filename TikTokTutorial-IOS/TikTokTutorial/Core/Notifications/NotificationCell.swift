//
//  NotificationCell.swift
//  TikTokTutorial
//
//  Created by Brandon Jemison on 12/28/23.
//

import SwiftUI

struct NotificationCell: View {
    var body: some View {
        HStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 32, height: 32)
                .foregroundStyle(Color(.systemGray5))
            
            HStack {
                Text("test user")
                    .font(.footnote)
                    .fontWeight(.semibold) +
                
                Text(" Liked on of your post ")
                    .font(.footnote) +
                
                Text("3d")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            Rectangle()
                .frame(width: 48, height: 48)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 6, height: 6)))
        }
        .padding(.horizontal)
    }
}

#Preview {
    NotificationCell()
}
