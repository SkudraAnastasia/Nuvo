//
//  FlashcardViewModel.swift
//  Nuvo
//
//  Created by Anastasia on 04.08.2026.
//

import Foundation
import Combine

final class FlashcardsViewModel: ObservableObject {
    @Published var words: [WordModel]
    @Published var currentIndex = 0
    @Published var isTranslationShown = false
    
    init(words: [WordModel]) {
        self.words = words
    }
    
    var currentWord: WordModel? {
        guard words.indices.contains(currentIndex) else { return nil }
        return words[currentIndex]
    }
    
    var isEmpty: Bool {
        words.isEmpty
    }
    
    var canGoNext: Bool {
        currentIndex < words.count - 1
    }
    
    var canGoPrevious: Bool {
        currentIndex > 0
    }
    
    var progressText: String {
        guard !isEmpty else { return "0 of 0" }
         return "\(currentIndex + 1) of \(words.count)"
    }
    
    var cardText: String {
        guard let currentWord else { return "" }
        return isTranslationShown ? currentWord.translation : currentWord.word
    }
    
    var progressValue: CGFloat {
        guard !isEmpty else { return 0 }
        return CGFloat(currentIndex + 1) / CGFloat(words.count)
    }

    func toggleTranslation() {
        isTranslationShown.toggle()
    }
    
    func nextCard() {
        guard canGoNext else { return }
        currentIndex += 1
        isTranslationShown = false
    }
    
    func previousCard() {
        guard canGoPrevious else { return }
        currentIndex -= 1
        isTranslationShown = false
    }
}
