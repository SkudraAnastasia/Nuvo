//
//  PracticeModeCardView.swift
//  Nuvo
//
//  Created by Anastasia on 29.07.2026.
//

import SwiftUI

struct PracticeModeCardView: View {
    let mode: PracticeMode
    
    var body: some View {
        HStack(spacing: 16) {
            Text(mode.emoji)
                .font(.system(size: 38))
                .frame(width: 70, height: 70)
                .background((mode.color).opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 35))
            VStack(alignment: .leading, spacing: 4) {
                Text(mode.title)
                    .foregroundStyle(.primary)
                    .font(.title2)
                    .fontWeight(.semibold)
                Text(mode.subtitle)
                    .foregroundStyle(.secondary)
                    .font(.callout)
            }
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.system(size: 16, weight: .bold))
                .foregroundStyle(.orange)
                .padding(.horizontal, 10)
        }
        .padding(18)
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 90)
        .background(.darkWhite)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 5)
    }
}

#Preview {
    PracticeModeCardView(mode: .flashcards)
}
