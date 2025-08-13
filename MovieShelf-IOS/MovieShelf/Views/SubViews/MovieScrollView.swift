//
//  MovieScrollView.swift
//  MovieShelf
//
//  Created by Brandon Jemison on 12/9/23.
//

import SwiftUI

struct MovieScrollView: View {
    let categoryTitle: String
    let movies: [Movie]
    var body: some View {
        Text(categoryTitle)
            .modifier(CustomTextModifier())
        
        ScrollView(.horizontal, showsIndicators: false) {
            MovieCategoryView(movies: movies)
        }
    }
}

    
    
