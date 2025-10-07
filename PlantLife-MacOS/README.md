# 🌱 PlantLife-MacOS

### Overview
**PlantLife** is a macOS app built with **SwiftUI** that helps users browse, track, and care for plants.  
It offers a clean master-detail interface where users can search, sort, and view detailed plant information, complete with care reminders and images.

---

### ✨ Features
- 📋 Browse categorized plant collections (Root, Leafy, Seed & Fruit, Stem & Flower).  
- 🔍 Search plants by name using the built-in search field.  
- 🗂️ Sort plants by name, watering date, or nutrient date.  
- 🖥️ macOS-style navigation using `NavigationSplitView`.  
- 🖼️ View rich images and descriptions for each plant.  
- ⏰ **Receive care reminders and notifications** for watering and nutrient schedules.  
- 🌿 Detailed view for each plant showing planting, blooming, and harvest timelines.  

---

### 🧰 Tech Stack
| Category | Details |
|----------|---------|
| **Language** | Swift |
| **Frameworks** | SwiftUI, Foundation, UserNotifications |
| **Architecture** | MVVM (`PlantViewModel` for data and reminders) |
| **Platform** | macOS |
| **UI Patterns** | `NavigationSplitView`, searchable lists, master-detail views |

---

### 🧩 UI Components
| Component | Description |
|-----------|-------------|
| `ContentView` | Root view showing all plants, search, and sorting. |
| `PlantDetailView` | Detailed plant info, image, and care sections. |
| `PlantRow` | Displays plant summary row in the list. |
| `PlantViewModel` | Handles plant data, reminders, and scheduling notifications. |

---

### 🧠 Notable Implementations
- **Master-Detail Navigation:** Optimized for macOS layout using `NavigationSplitView`.  
- **Dynamic Plant Images:** Loads images using the plant’s name automatically.  
- **Search & Sort Logic:** Supports text-based filtering and sorting triggers.  
- **Local Notifications:** Schedules care reminders for watering and nutrient tasks.  
- **Media Support:** Displays high-quality plant images and placeholder descriptions.  
- **State Management:** Powered by SwiftUI’s reactive bindings and `@ObservedObject` pattern.  

---

### 🚀 Future Improvements
- Persist reminder data across launches with Core Data.  
- Integrate progress tracking (growth stages, harvest logs).  
- Add support for cross-device sync via iCloud.  
- Enable image capture and storage using macOS Photos picker.  

---

