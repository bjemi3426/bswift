# 📸 PictureVault-iOS

### Overview
**PictureVault** is an iOS app that allows users to securely view, manage, and add photos using a simple interface.  
It demonstrates SwiftUI layouts, list management, navigation, and integration with the native **UIImagePickerController** for photo selection.

---

### ✨ Features
- 📷 Add new photos from the **photo library** or **camera**.  
- 🖼️ View photos in a scrollable list (`List`).  
- 🔒 Designed as a personal vault to organize photos.  
- SwiftUI-based layout with gradient backgrounds and navigation support.  

---

### 🧰 Tech Stack
| Category | Details |
|----------|---------|
| **Language** | Swift |
| **Frameworks** | SwiftUI, UIKit integration (UIImagePickerController) |
| **Architecture** | MVVM (`ContentDataViewModel` handles state for images) |
| **Platform** | iOS |
| **UI Patterns** | NavigationView, List, custom ImagePicker integration |

---

### 🧩 UI Components
| Component | Description |
|-----------|-------------|
| `ContentView` | Root view showing a gradient background, navigation, and photo list. |
| `PhotoRow` | Displays an individual photo (implementation inferred from usage). |
| `ImagePicker` | UIKit `UIImagePickerController` wrapped in SwiftUI for photo selection. |
| `ContentDataViewModel` | ObservableObject handling image state (`picture` and picker visibility). |
| `ImagePickerCoordinator` | Handles UIImagePickerController delegate callbacks. |

---

### 🧠 Notable Implementations
- **SwiftUI + UIKit Integration:** Custom `UIViewControllerRepresentable` for the image picker.  
- **State Management:** Uses `@ObservedObject` and `@Published` to update UI when images are selected.  
- **Dynamic Photo Addition:** NavigationLink opens the image picker for adding new photos.  
- **Gradient UI:** LinearGradient used for background styling.  

---

### 🚀 Future Improvements
- Add persistent storage for photos using Core Data or file system.  
- Implement delete/edit functionality for saved photos.  
- Add photo categorization or tagging.  
- Integrate iCloud sync or export options.  

---

