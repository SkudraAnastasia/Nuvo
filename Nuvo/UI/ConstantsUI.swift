//
//  Constants.swift
//  Nuvo
//
//  Created by Anastasia on 20.07.2026.
//
import SwiftUI

enum ButtonType {
    case primary
    case secondary
    
    var backgroundColors: [Color] {
        switch self {
        case .primary:
            [.orange, .yellow]
        case .secondary:
            [.warmOrange.opacity(0.02)]
        }
    }
    var textForegroundColor: Color {
        switch self {
        case .primary:
            return .white

        case .secondary:
            return .orange
        }
    }
    
    var textSize: CGFloat {
        switch self {
        case .primary:
            return 24

        case .secondary:
            return 20
        }
    }

    var borderColor: Color {
        switch self {
        case .primary:
            return .clear

        case .secondary:
            return .warmOrange.opacity(0.5)
        }
    }

    var borderStyle: StrokeStyle {
        switch self {
        case .primary:
            return StrokeStyle(lineWidth: 0)

        case .secondary:
            return StrokeStyle(lineWidth: 3, dash: [5, 3])
        }
    }
}
