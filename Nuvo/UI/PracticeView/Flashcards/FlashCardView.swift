//
//  FlashCardView.swift
//  Nuvo
//
//  Created by Anastasia on 05.08.2026.
//

import SwiftUI
import Combine

struct FlashCardView: View {
    let text: String
    let isTranslationShown: Bool
    let onTap: () -> Void
    
    var body: some View {
        VStack {
            Spacer()
            
            Text(text)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.primary)
                .padding(.top, 26)
                .rotation3DEffect(
                    .degrees(isTranslationShown ? 180 : 0),
                    axis: (x: 0, y: 1, z: 0)
                )
                .animation(.spring(response: 0.45, dampingFraction: 0.85), value: isTranslationShown)
            
            
            Spacer()
            
            Text("Tap to reveal")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.darkBrown)
                .padding(.bottom, 26)
                .rotation3DEffect(
                    .degrees(isTranslationShown ? 180 : 0),
                    axis: (x: 0, y: 1, z: 0)
                )
                .animation(.spring(response: 0.45, dampingFraction: 0.85), value: isTranslationShown)
        }
        .frame(width: 300, height: 380)
        .background(.darkWhite)
        .clipShape(RoundedRectangle(cornerRadius: 26))
        .shadow(color: .black.opacity(0.1), radius: 8)
        .rotation3DEffect(
            .degrees(isTranslationShown ? 180 : 0),
            axis: (x: 0, y: 1, z: 0)
        )
        .animation(.spring(response: 0.45, dampingFraction: 0.85), value: isTranslationShown)
        .onTapGesture {
            onTap()
        }
    }
}

#Preview {
    FlashCardView(text: "хуй", isTranslationShown: false, onTap: {})
}
