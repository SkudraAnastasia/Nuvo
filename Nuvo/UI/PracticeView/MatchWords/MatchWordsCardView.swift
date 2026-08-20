//
//  MatchWordsCard.swift
//  Nuvo
//
//  Created by Anastasia on 15.08.2026.
//

import SwiftUI

struct MatchWordsCardView: View {
    let text: String
    let isSelected: Bool
    let status: MatchWordsCardStatus
    let action: () -> Void
    
    private var backgroundColor: Color {
        switch status {
        case .matched:
            .green.opacity(0.2)
        case .wrong:
            .red.opacity(0.2)
        case .normal:
            .darkWhite
        }
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
                .padding()
                .foregroundStyle(.primary)
                .font(.headline)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .frame(width: 180, height: 70)
                .background(backgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        .buttonStyle(.plain)
        .shadow(color: .black.opacity(0.1), radius: 4)
        .overlay(isSelected ? RoundedRectangle(cornerRadius: 16).stroke(Color.orange, lineWidth: 2) : nil)
        
    }
}

#Preview {
    MatchWordsCardView(text: "misunderstanding", isSelected: true, status: .matched, action: {})
}
