//
//  UserCell.swift
//  TikTokTutorial
//
//  Created by Brandon Jemison on 12/28/23.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 48, height: 48)
                .foregroundStyle(Color(.systemGray5))
            
            VStack(alignment: .leading) {
                Text("test user")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text("test name")
                    .font(.footnote)
            }
            Spacer()
        }
        
    }
}

#Preview {
    UserCell()
}
