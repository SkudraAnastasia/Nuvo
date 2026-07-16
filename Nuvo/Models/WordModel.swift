//
//  wordsModel.swift
//  Nuvo
//
//  Created by Anastasia on 17.06.2026.
//
import Foundation

struct WordModel: Identifiable {
    let id = UUID()
    let createdAt: Date
    var word: String
    var translation: String
    
    init(
        word: String,
        translation: String,
        createdAt: Date = Date()
    ) {
        self.word = word
        self.translation = translation
        self.createdAt = createdAt
    }
}
