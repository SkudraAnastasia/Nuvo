//
//  Constants.swift
//  Nuvo
//
//  Created by Anastasia on 15.06.2026.
import SwiftUI

enum AppTab: CaseIterable {
    case home
    case practice
    case statistic
    case settings

    
    var title: String {
        switch self {
        case .home: "Home"
        case .practice: "Practice"
        case .statistic: "Statistics"
        case .settings: "Settings"
        }
    }
    
    var icon: String {
        switch self {
        case .home: "house"
        case .practice: "dumbbell.fill"
        case .statistic: "chart.bar"
        case .settings: "gearshape"
        }
    }
}

enum DefaultGroups {
  static let defaultGroups = [
        WordGroupModel(
            title: "Favourites",
            words: [],
            isSystem: true,
            emoji: "⭐️",
            color: .yellow
        ),
        WordGroupModel(
            title: "Travel",
            words: [],
            isSystem: false,
            emoji: "✈️",
            color: .blue
        ),
        WordGroupModel(
            title: "Work",
            words: [],
            isSystem: false,
            emoji: "💼",
            color: .green
        ),
        WordGroupModel(
            title: "Food",
            words: [],
            isSystem: false,
            emoji: "🍔",
            color: .orange
        ),
        WordGroupModel(
            title: "Study",
            words: [],
            isSystem: false,
            emoji: "📚",
            color: .red
        ),
        WordGroupModel(
            title: "Hobbies",
            words: [],
            isSystem: false,
            emoji: "🎨",
            color: .purple
        ),
        WordGroupModel(
            title: "Home",
            words: [],
            isSystem: false,
            emoji: "🏡",
            color: .cyan
        )
    ]
}

enum FocusedField {
    case word
    case translation
}

