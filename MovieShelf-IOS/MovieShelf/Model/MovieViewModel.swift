import Foundation
import Combine

struct Movie: Codable {
    let title: String
    let overview: String
    let poster_path: String?
}

class MovieViewModel: ObservableObject {
    @Published var nowPlayingMovies: [Movie] = []
    @Published var popularMovies: [Movie] = []
    @Published var topRatedMovies: [Movie] = []
    let categories = ["Now Playing", "Popular", "Top Rated"]
    var key = "e504e1e2ab6f4840221b609c991e8c7f"
    private var cancellables: Set<AnyCancellable> = []
    
    func fetchMovies(for category: CategoryEndPoints) {
        guard let url = URL(string: category.rawValue + key) else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: MovieResult.self, decoder: JSONDecoder())
            .replaceError(with: MovieResult(results: []))
            .sink { [weak self] result in
                switch category {
                case .popular:
                    self?.popularMovies = result.results
                case .topRated:
                    self?.topRatedMovies = result.results
                case .nowPlaying:
                    self?.nowPlayingMovies = result.results
                }
            }
            .store(in: &cancellables)
    }
    
    func fetchAllMovies() {
        fetchMovies(for: CategoryEndPoints.nowPlaying)
        fetchMovies(for: CategoryEndPoints.popular)
        fetchMovies(for: CategoryEndPoints.topRated)
    }
}

struct MovieResult: Codable {
    let results: [Movie]
}
