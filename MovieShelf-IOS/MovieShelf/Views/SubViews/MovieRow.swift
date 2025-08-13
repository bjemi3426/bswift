//
//  MovieRow.swift
//  MovieShelf
//
//  Created by Brandon Jemison on 12/11/23.
//

import SwiftUI

struct MovieRow: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.fill")
                    .frame(width:77, height:47.5)
                    .background(.gray)
                    .cornerRadius(10)
                VStack(alignment:.leading) {
                    Text("Movie title")
                        .font(.caption)
                    Text("1998")
                        .font(.caption)
                    HStack {
                        Image(systemName: "star.fill")
                            
                        Text("4.8")
                            .font(.caption)
                        Text("(160) ratings")
                            .font(.caption)
                    }
                }
            }
        }
        .foregroundColor(.white)
    }
}


