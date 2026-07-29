//
//  PracticeMode.swift
//  Nuvo
//
//  Created by Anastasia on 29.07.2026.
//
import Foundation
import SwiftUI

enum PracticeMode: CaseIterable, Identifiable {
    case flashcards
    case matchWords
    case typeAnswer
    
    var id: Self { self }
    
    var title: String {
        switch self {
        case .flashcards: "Flashcards"
        case .matchWords: "MatchWords"
        case .typeAnswer: "TypeAnswer"
        }
    }
    
    var subtitle: String {
        switch self {
        case .flashcards: "Review words one by one"
        case .matchWords: "Connect words and translations"
        case .typeAnswer: "Write the english word"
        }
    }
    
    var emoji: String {
        switch self {
        case .flashcards: "📒"
        case .matchWords: "🔗"
        case .typeAnswer: "📝"
        }
    }
    
    var color: Color {
        switch self {
        case .flashcards: .yellow
        case .matchWords: .green
        case .typeAnswer: .pink
        }
    }
}
