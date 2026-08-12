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
         ProgressView(progress: <#T##CGFloat#>)
        }
        .navigationTitle("MatchWords")
    }
}

#Preview {
    MatchWordsView(words: [WordModel(word: "хуй", translation: "писька"), WordModel(word: "rgvbrtb", translation: "efv3ef"), WordModel(word: "хуй", translation: "писька"), WordModel(word: "ааааааааааааааааааааааааааааааааааааа", translation: "писька"), WordModel(word: "иии", translation: "писька"), WordModel(word: "хуй", translation: "писька"), WordModel(word: "хуй", translation: "писька"), ])
}
