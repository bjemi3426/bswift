import Foundation

enum ToolbarSelection: Identifiable {
    case first, second, third

    var id: Int {
        hashValue
    }
}

enum CategoryEndPoints: String {
    case nowPlaying = "https://api.themoviedb.org/3/movie/now_playing?api_key="
    case popular = "https://api.themoviedb.org/3/movie/popular?api_key="
    case topRated = "https://api.themoviedb.org/3/movie/top_rated?api_key="
}



