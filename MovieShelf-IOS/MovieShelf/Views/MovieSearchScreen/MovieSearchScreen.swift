//
//  MovieSearchScreen.swift
//  MovieShelf
//
//  Created by Brandon Jemison on 12/11/23.
//

import SwiftUI

struct MovieSearchScreen: View {
    @State var movieTitle = ""
    @State var selectedScreen: ToolbarSelection?
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                VStack {
                    VStack(spacing: 30) {
                        SearchBar(text: $movieTitle) {
                        }.padding(.all)
                        recentSearchesView
                        reccomendedMoviesView
                    }
                    Spacer()
                }
                .navigationTitle("Search").navigationBarTitleDisplayMode(.inline)
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
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    var recentSearchesView: some View {
        VStack {
            HStack {
                Spacer()
                Text("Recent searches")
                    .foregroundColor(.white)
                    .bold()
                    .font(.subheadline)
                Button(action: {
                }) {
                    Spacer()
                    Text("view all")
                        .foregroundColor(.white)
                        .font(.caption)
                    
                    
                        .background(Capsule().foregroundColor(.black))
                }
                Spacer()
            }.padding()
            HStack {
                VStack {
                    Image(systemName: "person.fill")
                        .frame(width: 154, height: 95)
                        .background(.gray)
                        .cornerRadius(10)
                    
                    
                    Text("Movie Title")
                    
                }
                .foregroundColor(.white)
                
                
                VStack {
                    Image(systemName: "person.fill")
                        .frame(width: 154, height: 95)
                        .background(.gray)
                        .cornerRadius(10)
                    
                    Text("Movie Title")
                }
                .foregroundColor(.white)
                
                Spacer()
                
            }
            .padding()
        }
    }
    
    var reccomendedMoviesView: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Text("Reccomended for you")
                    .foregroundColor(.white)
                    .bold()
                    .font(.subheadline)
                Button(action: {}) {
                    Spacer()
                    Text("view all")
                        .foregroundColor(.white)
                        .font(.caption)
                    
                    
                        .background(Capsule().foregroundColor(.black))
                }
                Spacer()
            }.padding()
            
            ScrollView {
                MovieRow()
                Divider()
                MovieRow()
                Divider()
                MovieRow()
                Divider()
                MovieRow()
            }
            
        }
    }
}

struct SearchBar: View {
    @Binding var text: String
    var onSearchButtonClicked: () -> Void
    
    var body: some View {
        HStack {
            TextField("Search for movies and TV shows", text: $text, onCommit: onSearchButtonClicked)
                .padding(8)
                .background(Color(.systemGray6))
                .cornerRadius(10)
            
            Button(action:  {
                onSearchButtonClicked()
            }) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.white)
            }
            .padding(.leading, 8)
        }
    }
}


