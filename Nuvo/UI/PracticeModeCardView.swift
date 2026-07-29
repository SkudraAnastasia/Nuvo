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
                .font(.system(size: 42))
                .frame(width: 76, height: 76)
                .background((mode.color).opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 38))
            VStack(alignment: .leading, spacing: 6) {
                Text(mode.title)
                    .foregroundStyle(.primary)
                    .font(.title)
                    .fontWeight(.semibold)
                Text(mode.subtitle)
                    .foregroundStyle(.secondary)
                    .font(.callout)
            }
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.system(size: 13, weight: .semibold))
                .foregroundStyle(.orange)
        }
        .padding()
    }
}

#Preview {
    PracticeModeCardView(mode: .flashcards)
}
