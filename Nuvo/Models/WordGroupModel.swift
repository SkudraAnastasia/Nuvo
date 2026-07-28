//
//  WordGroupModel.swift
//  Nuvo
//
//  Created by Anastasia on 01.07.2026.
//
import Foundation
import SwiftUI

enum GroupColor {
    case yellow
    case blue
    case green
    case orange
    case red
    case purple
    case cyan
    
    var groupColor: Color {
        switch self {
        case .yellow:
            return .yellow
        case .blue:
            return .blue
        case .green:
            return .green
        case .orange:
            return .orange
        case .red:
            return .red
        case .purple:
            return .purple
        case .cyan:
            return .cyan
        }
    }
}

struct WordGroupModel: Identifiable {
    let id = UUID()
    var title: String
    var words: [WordModel]
    var isSystem: Bool
    var emoji: String?
    var color: GroupColor?
}
