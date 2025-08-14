//
//  SentencesViewModel.swift
//  SwitchingLangs
//
//  Created by Bjem on 7/16/25.
//

import Foundation

struct Sentence: Identifiable, Codable {
    let id = UUID()
    let sentence: String
    let translation: String
    
    private enum CodingKeys: String, CodingKey {
        case sentence, translation
    }
}


class SentencesViewModel: ObservableObject {
    
    
    static func load() -> [Sentence] {
        guard let url = Bundle.main.url(forResource: "sentences", withExtension: "json") else {
            print("sentences.json not found")
            return []
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let sentences = try decoder.decode([Sentence].self, from: data)
            print(sentences.count)
            return sentences
          
        } catch {
            print("Failed to decode JSON:", error)
            return []
        }
    }
}
