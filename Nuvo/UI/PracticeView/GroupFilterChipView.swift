//
//  GroupFilterCheapView.swift
//  Nuvo
//
//  Created by Anastasia on 02.08.2026.
//

import SwiftUI

struct GroupFilterChipView: View {
    let title: String
    let emoji: String
    let isSelected: Bool
    let action: () -> Void
    
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Text(emoji)
                    .font(.callout)
                    .shadow(color: .black.opacity(0.2), radius: 1)
                Text(title)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundStyle(isSelected ? Color.white : .primary)
                    .shadow(
                        color: isSelected ? .white.opacity(0.5) : .clear,
                        radius: isSelected ? 4 : 0
                    )
            }
            .padding(.horizontal)
            .frame(height: 40)
            .background {
                if isSelected {
                    LinearGradient(
                        colors: [.orange, .yellow],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                } else {
                    Color.darkWhite
                }
            }
            .clipShape(.capsule)
            .shadow(color: .black.opacity(0.05), radius: 4)
        }
    }
}

#Preview {
    GroupFilterChipView(title: "Favorites", emoji: "⭐️", isSelected: true, action: {})
}
