//
//  MatchWordsViewModel.swift
//  Nuvo
//
//  Created by Anastasia on 11.08.2026.
//

import SwiftUI
import Combine

final class MatchWordsViewModel: ObservableObject {
    @Published var currentRoundIndex = 0
    @Published var wordCards: [MatchWordsCardModel] = []
    @Published var translationCards: [MatchWordsCardModel] = []
    @Published var selectedCard: MatchWordsCardModel?
    @Published var matchedWordIDs: Set<WordModel.ID> = []
    @Published var wrongCardIDs: Set<MatchWordsCardModel.ID> = []
    
    let pairsPerRound = 5
    
    private let preparedWords: [WordModel]
    
    init(words: [WordModel]) {
        self.preparedWords = Self.prepareWordsForRounds(words: words, pairsPerRound: pairsPerRound)
        prepareCardsForCurrentRound()
    }

    var roundsCount: Int {
        guard !preparedWords.isEmpty else { return 0 }
        return preparedWords.count / pairsPerRound
    }
    
    var startIndex: Int {
        currentRoundIndex * pairsPerRound
    }
    
    var endIndex: Int {
        startIndex + pairsPerRound
    }
    var canGoNext: Bool {
       (roundsCount - (currentRoundIndex + 1)) > 0
    }
    
    var currentRoundWords: [WordModel] {
        guard roundsCount > 0 else { return [] }
        return Array(preparedWords[startIndex..<endIndex])
    }

    var progressValue: CGFloat {
        guard roundsCount > 0 else { return 0 }
        return CGFloat(currentRoundIndex + 1) / CGFloat(roundsCount)
    }
    
    var progressText: String {
        guard roundsCount > 0 else { return "0 of 0" }
        return "\(currentRoundIndex + 1) of \(roundsCount)"
    }
    
    static func prepareWordsForRounds(words: [WordModel], pairsPerRound: Int) -> [WordModel] {
        var prepared = words
        
        let remainder = words.count % pairsPerRound
        
        if remainder != 0 {
            let missingCount = pairsPerRound - remainder
            let repeatedWords = words.prefix(missingCount)
            prepared.append(contentsOf: repeatedWords)
        }
        return prepared
    }
    
    func prepareCardsForCurrentRound() {
        wordCards = currentRoundWords.map { word in
            MatchWordsCardModel(
                wordID: word.id,
                text: word.word,
                side: .word
            )
        }
        .shuffled()
        
        translationCards = currentRoundWords.map { word in
            MatchWordsCardModel(
                wordID: word.id,
                text: word.translation,
                side: .translation
            )
        }
        .shuffled()
    }
    
    func nextRound() {
        guard canGoNext else { return }
        currentRoundIndex += 1
        
        wrongCardIDs.removeAll()
        matchedWordIDs.removeAll()
        selectedCard = nil
        prepareCardsForCurrentRound()
    }
    
    func isSelected(card: MatchWordsCardModel) -> Bool {
         selectedCard?.id == card.id
    }
    
    func isWrong(card: MatchWordsCardModel) -> Bool {
        wrongCardIDs.contains(card.id)
    }
    
    func isMatched(card: MatchWordsCardModel) -> Bool {
        matchedWordIDs.contains(card.wordID)
    }
    
    func status(for card: MatchWordsCardModel) -> MatchWordsCardStatus {
        if matchedWordIDs.contains(card.wordID) {
            return .matched
        } else if wrongCardIDs.contains(card.id) {
            return .wrong
        } else {
            return .normal
        }
    }
    
    func matchCard(card: MatchWordsCardModel) {
        guard !matchedWordIDs.contains(card.wordID) else { return }
  
        guard let selectedCard else {
            selectedCard = card
            return
        }
        
        if selectedCard.side == card.side {
            self.selectedCard = card
            return
        }
        
        if selectedCard.wordID == card.wordID {
            matchedWordIDs.insert(card.wordID)
            self.selectedCard = nil
            
            if self.matchedWordIDs.count == self.pairsPerRound {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    self.nextRound()
                }
            }
            
        } else {
            wrongCardIDs = [selectedCard.id, card.id]
            self.selectedCard = nil
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.45) {
                self.wrongCardIDs.removeAll()
            }
        }
    }
}
