//
//  FlashcardsProgressView.swift
//  Nuvo
//
//  Created by Anastasia on 05.08.2026.
//

import SwiftUI

struct FlashcardsProgressView: View {
    let progress: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
               Capsule()
                    .fill(Color.gray.opacity(0.18))
                    .frame(width: geometry.size.width)
               
                Capsule()
                    .fill(
                        LinearGradient(
                            colors: [.orange, .yellow],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .frame(width: geometry.size.width * progress)
            }
        }
        .frame(height: 8)
        .clipShape(.capsule)
        
    }
}

#Preview {
    FlashcardsProgressView(progress: 1)
}
