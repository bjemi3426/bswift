//
//  ContentView.swift
//  SwitchingLangs
//
//  Created by Bjem on 7/16/25.
//

import SwiftUI

struct ContentView: View {
    let flashcards = FlashCardViewModel.loadSpanishWords()
    let sentences = SentencesViewModel.load()
    let frenchFlashcards = FlashCardViewModel.loadFrenchWords()
    @State var sentenceButtonTapped = false
    var body: some View {
        VStack {
            
            if sentenceButtonTapped {
                List(sentences) { sentence in
                    HStack {
                        Text(sentence.sentence)
                        Divider()
                        Text(sentence.translation)
                        Button(action: {
                            SpeechManager.shared.speak(sentence.sentence)
                        }) {
                            Image(systemName: "speaker.fill")
                        }
                    }
                    
                }
            } else {
                List(frenchFlashcards) { card in
                    FlashCardRow(notesButtTapped: $sentenceButtonTapped, card: card)
                    Divider()
                    
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .automatic) {
                
                Button(action: {
                    sentenceButtonTapped.toggle()
                }) {
                    
                    Image(systemName: "arrowshape.backward")
                    
                }
                .help("Switch back  to main")
                .disabled(!sentenceButtonTapped)
                
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
