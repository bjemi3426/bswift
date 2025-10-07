# 🌱 PlantLife-MacOS

### Overview
**PlantLife** is a macOS app built with **SwiftUI** that helps users browse, sort, and view detailed information about various plants.  
It demonstrates the use of `NavigationSplitView`, searchable lists, state management via `ObservableObject`, and modular SwiftUI components for a master-detail experience.

---

### ✨ Features
- 📋 Browse a categorized list of plants (Root, Leafy, Seed & Fruit, Stem & Flower).  
- 🔍 Search plants by name using a search bar.  
- 🗂️ Sort plants by name, water date, or nutrient date (via confirmation dialog).  
- 📖 View detailed plant information on selection (`PlantDetailView`).  
- 🌿 Displays plant category, dates for planting, expected harvest, watering, and nutrients.  
- 🖼️ Shows plant images dynamically based on name.  
- 🖥️ macOS-specific layout with `NavigationSplitView` for master-detail interface.  

---

### 🧰 Tech Stack
| Category | Details |
|----------|---------|
| **Language** | Swift |
| **Frameworks** | SwiftUI, Foundation |
| **Architecture** | MVVM (`PlantViewModel` manages plant data) |
| **Platform** | macOS |
| **UI Patterns** | `NavigationSplitView`, searchable list, master-detail, dynamic image loading |

---

### 🧩 UI Components
| Component | Description |
|-----------|-------------|
| `ContentView` | Root view displaying the list of plants and handling selection. |
| `PlantDetailView` | Detailed view for selected plant including image, care info, and key dates. |
| `PlantRow` | Displays a single plant in the list. |
| `PlantViewModel` | ObservableObject that manages plant data and categories. |

---

### 🧠 Notable Implementations
- **Master-Detail Layout:** Uses `NavigationSplitView` for macOS-friendly navigation.  
- **Searchable & Sortable List:** Dynamic filtering and potential sorting options.  
- **Detailed Plant Info:** Includes multiple sections for care, growth, and expected yields.  
- **Dynamic Image Loading:** Images automatically pulled from plant names.  
- **State Management:** Handles selection, search text, and sort actions via `@State` and `@ObservedObject`.  

---

### 🚀 Future Improvements
- Implement sorting functionality in the confirmation dialog.  
- Add persistent storage (Core Data or local JSON).  
- Add care reminders and notifications for selected plants.  
- Include more images and media for each plant.  
- Improve layout responsiveness for different macOS window sizes.  

---
