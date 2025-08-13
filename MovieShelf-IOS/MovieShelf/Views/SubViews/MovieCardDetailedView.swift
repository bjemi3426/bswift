
import SwiftUI

struct MovieCardDetailedView: View {
    let movie: Movie
    
    var body: some View {
        VStack {
            if let url = movie.poster_path {
                AsyncImage(url: URL(string: url))
            }
           
            Text(movie.title)
                .font(.title)
            ScrollView {
                Text(movie.overview)
                    .font(.caption)
                .padding()
            }
        }
       
    }
}



