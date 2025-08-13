//
//  ContentView.swift
//  MovieShelf
//
//  Created by Brandon Jemison on 12/4/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var movieViewModel = MovieViewModel()
    @State var  selectedScreen: ToolbarSelection?
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(alignment: .center, spacing: 15) {
                        ForEach(movieViewModel.categories, id: \.self) { category in
                            MovieScrollView(categoryTitle: category, movies: movies(for: category))
                        }
                        .onAppear {
                            print("appeared")
                            movieViewModel.fetchAllMovies()
                            
                        }
                        
                    }
                    .toolbarBackground(Color.black, for: .navigationBar)
                    .foregroundColor(.white)
                    .padding(.leading)
                    .navigationTitle("Movie Shelf")
                    .background(Color.gray.opacity(0.1))
                    .navigationBarTitleDisplayMode(.inline)
                    
                    
                }
                .toolbar {
                    CustomToolBar(selectedScreen: $selectedScreen)
                }
                .tint(.black)
            }
            .fullScreenCover(item: $selectedScreen) { item in
                switch item {
                case .first:
                    ContentView()
                case .second:
                    MovieSearchScreen()
                case .third:
                    MovieFavoritesView()
                }
            }
        }
    }
    
    private func movies(for category: String) -> [Movie] {
        switch category {
        case "Now Playing":
            return movieViewModel.nowPlayingMovies
        case "Popular":
            return movieViewModel.popularMovies
        case "Top Rated":
            return movieViewModel.topRatedMovies
        default:
            return []
        }
    }
}



struct content_view: PreviewProvider {
    @State var  selectedScreen = ToolbarSelection.first
    static var previews: some View {
        ContentView()
    }
}

