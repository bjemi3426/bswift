//
//  FlashCardRow.swift
//  SwitchingLangs
//
//  Created by Bjem on 7/16/25.
//

import SwiftUI

struct FlashCardRow: View {
    @Binding var notesButtTapped: Bool 
    let card: Flashcard
    var body: some View {
        HStack {
            VStack {
                HStack {
                    Text("Word:")
                    Text(card.word)
                }
                HStack {
                    Text("Language:")
                    Text(card.language)
                }
                HStack {
                    Text("Translation:")
                    Text(card.translation)
                }
            }
            Button(action: {
                SpeechManager.shared.speak(card.word)
            }) {
                Image(systemName: "speaker.fill")
            }
            
            Button(action: {
                
                notesButtTapped.toggle()
            }) {
                Image(systemName: "note.text")
            }
        }
        
    }
}

//struct FlashCardRow_Previews: PreviewProvider {
//    static var previews: some View {
//        FlashCardRow()
//    }
//}
