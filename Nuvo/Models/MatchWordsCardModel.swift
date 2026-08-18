//
//  MatchWordsCardModel.swift
//  Nuvo
//
//  Created by Anastasia on 16.08.2026.
//
import Foundation

enum MatchCardSide {
    case word
    case translation
}

struct MatchWordsCardModel: Identifiable, Equatable {
 
    let id = UUID()
    let wordID: WordModel.ID
    let text: String
    let side: MatchCardSide
}
