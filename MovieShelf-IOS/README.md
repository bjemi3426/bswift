# 📱 MovieShelf

### Overview
List all the latest movies and allows for search using IMDB.






### Features
- 🎬 Browse movies by category (Now Playing, Popular, Top Rated)
- 🔍 Search for movies using IMDB API
- ❤️ Favorite and manage saved movies
- 🧭 Custom bottom toolbar for navigation

### Tech Stack
- **Language:** Swift
- **Frameworks:** SwiftUI, Combine, Core Data, etc.
- **Architecture:** MVVM 
- **Persistence:** UserDefaults
- **API / Networking:** URLSession 

### UI Components
| Component              | Description                                                                             |
| ---------------------- | --------------------------------------------------------------------------------------- |
| **ContentView**        | Root view that displays multiple horizontal movie lists within a vertical `ScrollView`. |
| **MovieScrollView**    | Horizontal scroll view for a specific movie category, rendering `MovieCard` items.      |
| **CustomToolBar**      | Bottom toolbar allowing quick navigation between Home, Search, and Favorites.           |
| **MovieSearchScreen**  | Dedicated screen for searching movies from IMDB API.                                    |
| **MovieFavoritesView** | Displays movies added to favorites by the user.                                         |


### Notable Implementations
- Example: Custom CameraView using `UIImagePickerController`
- Example: Reusable Card Component with animations
- Example: Light/Dark mode support

### Future Improvements
- Add movie detail view with cast, trailer, and similar movies.
- Implement poster caching with `AsyncImage` or a custom cache layer.
- Introduce pagination and pull-to-refresh.
- Add unit tests for `MovieViewModel` and API handling.
- Integrate persistent favorites with Core Data or SwiftData.


### Screenshots
*(Optional — add images from your simulator later)*

---

You can add a "Demo" section with GIFs or links to videos once you have them.

---

If you post your first project’s code (or main files), I’ll extract all the key info and generate a finished README in that style.

Would you like me to:
- **(A)** Stick with the concise version (1-page clean summary),  
or  
- **(B)** Include more detail (technical deep-dive, recruiter-style emphasis on skills)?
