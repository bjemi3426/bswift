//
//  SpeechManager.swift
//  SwitchingLangs
//
//  Created by Bjem on 7/16/25.
//

import AVFoundation


class SpeechManager {
    static let shared = SpeechManager()
    private let synthesizer = AVSpeechSynthesizer()

    
    func speak(_ text: String, languageCode: String = "fr-FR") {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: languageCode)
        utterance.rate = 0.5 
        synthesizer.speak(utterance)
        for voice in AVSpeechSynthesisVoice.speechVoices() {
            print("\(voice.language): \(voice.name) — \(voice.identifier)")
        }

    }
}

