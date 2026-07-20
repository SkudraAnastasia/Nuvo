//
//  Constants.swift
//  Nuvo
//
//  Created by Anastasia on 15.06.2026.
import SwiftUI

enum AppTab: CaseIterable {
    case home
    case statistic
    case settings
    
    var title: String {
        switch self {
        case .home: "Home"
        case .statistic: "Statistics"
        case .settings: "Settings"
        }
    }
    
    var icon: String {
        switch self {
        case .home: "house"
        case .statistic: "chart.bar"
        case .settings: "gearshape"
        }
    }
}

enum DefaultGroups {
  static let defaultGroups = [
        WordGroupModel(
            title: "Favourites⭐️",
            words: [],
            isSystem: true
        ),
        WordGroupModel(
            title: "Travel✈️🏖",
            words: [],
            isSystem: false
        ),
        WordGroupModel(
            title: "Work💸💻",
            words: [],
            isSystem: false
        ),
        WordGroupModel(
            title: "Food🥘🍔",
            words: [],
            isSystem: false
        ),
        WordGroupModel(
            title: "Study📒📝",
            words: [],
            isSystem: false
        ),
        WordGroupModel(
            title: "Hobbies🎮🪂",
            words: [],
            isSystem: false
        ),
        WordGroupModel(
            title: "Home🏡🛏",
            words: [],
            isSystem: false
        )
    ]
}

enum FocusedField {
    case word
    case translation
}

