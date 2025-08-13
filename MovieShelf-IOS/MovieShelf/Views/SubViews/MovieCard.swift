
import SwiftUI

struct MovieCard: View {
    let movie: Movie
    
    var body: some View {
        VStack {
            if let imageURL = movie.poster_path {
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w185\(imageURL)"))
                    .cornerRadius(10)
            }
        }
    }
}

