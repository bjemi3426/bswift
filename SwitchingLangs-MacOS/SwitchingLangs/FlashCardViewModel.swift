import Foundation

struct Flashcard: Identifiable, Codable {
    let id = UUID()
    let word: String
    let translation: String
    let language: String
    
    private enum CodingKeys: String, CodingKey {
        case word, translation, language
    }
}


class FlashCardViewModel: ObservableObject {
    
    
    static func loadSpanishWords() -> [Flashcard] {
        guard let url = Bundle.main.url(forResource: "flashcards", withExtension: "json") else {
            print("flashcards.json not found")
            return []
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let flashcards = try decoder.decode([Flashcard].self, from: data)
            print(flashcards.count)
            return flashcards
          
        } catch {
            print("Failed to decode JSON:", error)
            return []
        }
    }
    
    static func loadFrenchWords() -> [Flashcard] {
        guard let url = Bundle.main.url(forResource: "flashcards2", withExtension: "json") else {
            print("flashcards.json not found")
            return []
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let flashcards = try decoder.decode([Flashcard].self, from: data)
            print(flashcards.count)
            return flashcards
          
        } catch {
            print("Failed to decode JSON:", error)
            return []
        }
    }
}



