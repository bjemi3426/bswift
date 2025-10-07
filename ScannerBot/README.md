# 🤖 ScannerBot-iOS

### Overview
**ScannerBot** is an iOS app that demonstrates a simple product tracking and scanning interface with user authentication.  
It uses **SwiftUI** to handle navigation, product lists, and sign-in flows while showcasing state management via `@StateObject` and `@ObservedObject`.

---

### ✨ Features
- 🔐 Sign-in screen for user authentication.  
- 📋 Home screen displaying a list of recent products.  
- ➕ Add new products via a sheet modal.  
- ⭐ Favorite products tracking.  
- 🏷️ Simple product model including name, price, creation date, and favorite status.  
- 🖥️ Full-screen navigation from sign-in to main app via `fullScreenCover`.  

---

### 🧰 Tech Stack
| Category | Details |
|----------|---------|
| **Language** | Swift |
| **Frameworks** | SwiftUI, Foundation |
| **Architecture** | MVVM (`ProductsViewModel`, `HomeViewModel`) |
| **Platform** | iOS |
| **UI Patterns** | Navigation via full-screen cover, sheets, lists |

---

### 🧩 UI Components
| Component | Description |
|-----------|-------------|
| `ContentView` | Root view managing sign-in and navigation to main app. |
| `SignInView` | Handles user input for username and password. |
| `HomeScreenView` | Displays recent products and add-product button. |
| `ProductsViewModel` | ObservableObject managing product list and add-new-product state. |
| `Product` | Model representing a single product with id, name, price, creation date, and favorite status. |
| `AppTabView` | Tab-based main application view after sign-in (implementation inferred). |
| `AddProductView` | Modal sheet to add a new product (closure-based callback). |

---

### 🧠 Notable Implementations
- **State Management:** Uses `@StateObject` and `@ObservedObject` for product list and navigation state.  
- **Full-Screen Navigation:** `fullScreenCover` used to transition from sign-in to the main app.  
- **Dynamic Product List:** Supports adding and tracking products, including favorites.  
- **Modular UI:** Separate views for sign-in, home, and product management.  

---

### 🚀 Future Improvements
- Integrate scanning functionality (barcode or QR) for products.  
- Add persistent storage using Core Data or UserDefaults.  
- Include product search and filtering.  
- Add more robust authentication (biometrics or server-based login).  
- Enhance UI with images for each product.  

---

### 🧑‍💻 Author
**John [GitHub handle]**  
iOS Developer | SwiftUI • MVVM • Product Tracking UI  
