import SwiftUI

struct MovieFavoritesView: View {
    @State private var favoriteMovies: [Movie] = []

    var body: some View {
        NavigationView {
            if favoriteMovies.isEmpty {
                EmptyFavoritesView()
            } else {
                List {
                    ForEach(favoriteMovies, id: \.title) { movie in
                        NavigationLink(destination: MovieCardDetailedView(movie: movie)) {
                            
                        }
                    }
                    .onDelete(perform: deleteMovie)
                }
                .navigationTitle("Favorites")
                .navigationBarItems(trailing: EditButton())
                .navigationBarBackButtonHidden(false)
            }
        }
    }

    private func deleteMovie(at offsets: IndexSet) {
        favoriteMovies.remove(atOffsets: offsets)
    }
}

struct EmptyFavoritesView: View {
    var body: some View {
        VStack {
            Image(systemName: "plus.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)

            Text("Your favorites list is empty.")
                .font(.headline)
                .foregroundColor(.gray)


            Spacer()
        }
        .padding()
        .navigationBarTitle("Favorites").navigationBarTitleDisplayMode(.inline)
    }
}


