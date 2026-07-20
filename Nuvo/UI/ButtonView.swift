//
//  LargeButton.swift
//  Nuvo
//
//  Created by Anastasia on 17.06.2026.
//

import SwiftUI

struct ButtonView: View {
    let type: ButtonType?
    let title: String
    let iconName: String?
    let action: () -> Void
    
    init(type: ButtonType? = .primary, title: String, iconName: String? = nil, action: @escaping () -> Void) {
        self.type = type
        self.title = title
        self.iconName = iconName
        self.action = action
    }
    
    var body: some View {
        if let type {
            Button { action() } label: {
                HStack(spacing: 12) {
                    if let iconName {
                        ZStack {
                            RoundedRectangle(cornerRadius: 22)
                                .frame(width: 44, height: 44)
                                .foregroundStyle(Color.warmOrange.opacity(0.2))
                            
                            Image(systemName: iconName)
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundStyle(.orange)
                        }
                    }
                    Text(title)
                        .font((.system(size: type.textSize, weight: .semibold, design: .rounded)))
                        .foregroundStyle(type.textForegroundColor)
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
            .frame(maxWidth: .infinity, maxHeight: 78)
            .background(
                LinearGradient(
                    colors: type.backgroundColors,
                    startPoint: .bottomLeading,
                    endPoint: .topTrailing
                )
            )
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(type.borderColor, style: type.borderStyle)
            )
            .clipShape(RoundedRectangle(cornerRadius: 24))
            .padding(.horizontal)
        }
    }
}

