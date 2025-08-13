
import SwiftUI

struct MovieCategoryView: View {
    let movies: [Movie]
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack(spacing: 8) {
                ForEach(movies, id: \.title) { movie in
                    NavigationLink(destination: Text(movie.overview)) {
                        MovieCard(movie: movie)
                    }
                }
            }
        }
    }
}

