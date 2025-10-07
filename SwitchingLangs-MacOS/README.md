# 🌐 SwitchingLangs-MacOS

### Overview
**SwitchingLangs** is a macOS app designed to help users learn and practice foreign languages through **flashcards** and **example sentences**.  
It leverages **SwiftUI** for UI layout and **text-to-speech** functionality for pronunciation.

---

### ✨ Features
- 📖 Flashcards for Spanish and French vocabulary.  
- 📝 Display example sentences with translations.  
- 🔊 Text-to-speech for word and sentence pronunciation.  
- 🔄 Toggle between flashcards and sentences.  
- 💻 macOS-native interface using `List` and `VStack` for layouts.  

---

### 🧰 Tech Stack
| Category | Details |
|----------|---------|
| **Language** | Swift |
| **Frameworks** | SwiftUI, Foundation, AVFoundation (for text-to-speech via `SpeechManager`) |
| **Platform** | macOS |
| **Architecture** | MVVM (`FlashCardViewModel`, `SentencesViewModel`) |
| **UI Patterns** | Lists, toolbars, toggle buttons, bindings for state |

---

### 🧩 UI Components
| Component | Description |
|-----------|-------------|
| `ContentView` | Root view toggling between flashcards and sentences. |
| `FlashCardRow` | Displays a single flashcard with word, language, translation, and TTS button. |
| `SentencesViewModel` | Loads and decodes sentences from JSON file (`sentences.json`). |
| `FlashCardViewModel` | Loads vocabulary flashcards for different languages (Spanish, French). |
| `SpeechManager` | Singleton class handling text-to-speech playback. |
| Toolbar Button | Switches between flashcards and sentence lists dynamically. |

---

### 🧠 Notable Implementations
- **Dynamic Flashcard & Sentence Switching:** Uses `@State` and `@Binding` to toggle views.  
- **Text-to-Speech Integration:** Pronunciation of words and sentences for language learning.  
- **JSON Data Loading:** Loads sentences from a local JSON file for practice examples.  
- **Multi-Language Support:** Handles multiple languages (Spanish, French).  

---

### 🚀 Future Improvements
- Add persistent tracking of studied words or progress.  
- Add difficulty levels or spaced repetition algorithm for learning.  
- Integrate image or media for vocabulary flashcards.  
- Expand supported languages beyond Spanish and French.  
- Improve UI with card-style swipe gestures for flashcards.  

---
