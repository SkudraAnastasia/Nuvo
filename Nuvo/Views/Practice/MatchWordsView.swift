//
//  MatchWordsView.swift
//  Nuvo
//
//  Created by Anastasia on 11.08.2026.
//

import SwiftUI

struct MatchWordsView: View {
    @StateObject private var matchwordsViewModel: MatchWordsViewModel
    
    init(words: [WordModel]) {
       _matchwordsViewModel = StateObject(
            wrappedValue: MatchWordsViewModel(words: words)
       )
    }
    
    var body: some View {
        VStack(spacing: 12) {
            ProgressView(progress: matchwordsViewModel.progressValue)
                .padding(.horizontal, 30)
                .padding(.top, 20)
            Text(matchwordsViewModel.progressText)
                .foregroundStyle(.darkBrown)
                .font(.headline)
            
            Spacer()
            
            HStack(spacing: 12) {
                VStack(spacing: 12) {
                    Text("Words")
                        .foregroundStyle(.darkBrown)
                        .font(.headline)
                    ForEach(matchwordsViewModel.wordCards) { card in
                        MatchWordsCardView(
                            text: card.text,
                            isSelected: matchwordsViewModel.isSelected(card: card),
                            status: matchwordsViewModel.status(for: card),
                            action: {
                                matchwordsViewModel.matchCard(card: card)
                            }
                        )
                    }
                }
    
                
                
                VStack(spacing: 12) {
                    Text("Translation")
                        .foregroundStyle(.darkBrown)
                        .font(.headline)
                    
                    ForEach(matchwordsViewModel.translationCards) { card in
                        MatchWordsCardView(
                            text: card.text,
                            isSelected: matchwordsViewModel.isSelected(card: card),
                            status: matchwordsViewModel.status(for: card),
                            action: {
                                matchwordsViewModel.matchCard(card: card)
                            }
                        )
                    }
                }

            }
            
            Spacer()
        }
        .background(Color.orangeBackground.opacity(0.6))
        .navigationTitle("MatchWords")
    }
}

#Preview {
    MatchWordsView(words: [WordModel(word: "555", translation: "555"), WordModel(word: "rgvbrtb", translation: "efv3ef"), WordModel(word: "хуй", translation: "писька"), WordModel(word: "aaaaaaaaaaaaaaaаааааааааааа", translation: "писька"), WordModel(word: "иии", translation: "писька"), WordModel(word: "хуй", translation: "писька"), WordModel(word: "хуй", translation: "писька"), WordModel(word: "хуй", translation: "писька"), WordModel(word: "rgvbrtb", translation: "efv3ef"), WordModel(word: "хуй", translation: "писька"), WordModel(word: "aaaaaaaaaaaaaaa", translation: "писька"), WordModel(word: "иии", translation: "писька"), WordModel(word: "хуй", translation: "писька"), WordModel(word: "хуй", translation: "писька"),])
}
