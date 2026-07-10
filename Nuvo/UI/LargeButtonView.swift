//
//  LargeButton.swift
//  Nuvo
//
//  Created by Anastasia on 17.06.2026.
//

import SwiftUI

struct LargeButtonView: View {
    let title: String
    let colors: [Color]
    let action: () -> Void
    
    var body: some View {
        Button { action() } label: {
            Text(title)
                .font((.system(size: 28, weight: .semibold, design: .rounded)))
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
        }
            .frame(maxWidth: .infinity)
            .padding()
            .background(
                LinearGradient(
                    colors: colors,
                    startPoint: .bottomLeading,
                    endPoint: .topTrailing
                )
            )
            .clipShape(.capsule)
            .padding(.horizontal)
            .padding(.top, 8)
    }
}

