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
    let pairsPerRound = 5
    private let preparedWords: [WordModel]
    
    
    init(words: [WordModel]) {
        self.preparedWords = preparedWords
    }
    var startIndex: Int {
        currentRoundIndex * pairsPerRound
    }
    
    var progressValue: CGFloat {}
    
    var progressText: String {}
    
    func nextRound() {
        currentRoundIndex += 1
    }
}

