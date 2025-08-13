//
//  MovieTabview.swift
//  MovieShelf
//
//  Created by Brandon Jemison on 12/9/23.
//

import SwiftUI

struct MovieTabview: View {
    var body: some View {
        TabView {
            
            MovieCardDetailedView(movie: Movie(title: "Test", overview: "bhbffjdh", poster_path: ""))
                .tabItem ({ Image(systemName: "film.fill") })
        }
    }
}


