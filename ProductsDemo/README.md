# 🛍️ ProductsDemo

### Overview
**ProductsDemo** is an iOS app showcasing a product catalog with Core Data persistence.  
The app demonstrates SwiftUI layouts, TabView navigation, and dynamic data presentation via charts or card views. Users can add products, view favorites, and manage categories.

---

### ✨ Features
- 🛒 Browse products in a horizontally scrollable card view or a bar chart view.  
- 📊 View category breakdowns and product statistics.  
- ➕ Add new products via a modal sheet.  
- ⭐ Favorites tab for saved items.  
- 📸 Camera integration for adding product images.  
- ⚙️ Settings tab for app customization.  
- 🗑️ Context menu for deleting products.  

---

### 🧰 Tech Stack
| Category | Details |
|----------|---------|
| **Language** | Swift |
| **Frameworks** | SwiftUI, Core Data, Charts |
| **Architecture** | MVVM (ContentViewModel handles state & actions) |
| **Persistence** | Core Data (`@FetchRequest`) |
| **Navigation** | TabView, NavigationView, Sheets |
| **UI Styling** | Custom colors, shadows, rounded cards, charts |

---

### 🧩 UI Components
| Component | Description |
|-----------|-------------|
| `ContentView` | Root view with TabView for Products, Camera, Favorites, and Settings. |
| `ProductCardView` | Displays individual product information in a card layout. |
| `ProductChartView` | Shows product statistics as a bar chart. |
| `AddProductView` | Modal sheet to add new products. |
| `CameraView` | Camera interface to capture product images. |
| `FavoritesView` | List of favorited products. |
| `SettingsView` | App settings and customization options. |

---

### 🧠 Notable Implementations
- **Core Data Integration:** Persistent storage with dynamic fetch requests and sorting.  
- **Dynamic UI:** Toggle between card view and chart view.  
- **Context Menus:** Delete products directly from card views.  
- **TabView Navigation:** Separate sections for products, camera, favorites, and settings.  

---

### 🚀 Future Improvements
- Add image caching and optimized storage.  
- Include search and filter functionality for products.  
- Enhance chart visuals with animations.  
- Add unit tests for ViewModel and Core Data operations.  
- Integrate external APIs for product data import/export.  

---

### 🖼️ Screenshots
<div align="center"> <img src="./Screenshots/Screenshot-Login.png" width="260" alt="Products Screen"/> <img src="./Screenshots/Screenshot-Products.png" width="260" alt="Camera Screen"/> <img src="./Screenshots/Screenshot-Bargraph.png" width="260" alt="Settings Screen"/>
  <img src="./Screenshots/Screenshot-Settings.png" width="260" alt="Settings Screen"/> </div>

---
