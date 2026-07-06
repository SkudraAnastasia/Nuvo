//
//  wordsModel.swift
//  Nuvo
//
//  Created by Anastasia on 17.06.2026.
//
import Foundation

struct WordModel: Identifiable {
    let id = UUID()
    var word: String
    var translation: String
}
