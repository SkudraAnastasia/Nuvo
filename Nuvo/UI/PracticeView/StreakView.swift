//
//  StreakView.swift
//  Nuvo
//
//  Created by Anastasia on 30.07.2026.
//

import SwiftUI

struct StreakView: View {
    var body: some View {
        HStack(spacing: 16) {
            Text("🔥")
                .font(.system(size: 38))
                .frame(width: 70, height: 70)
                .background(.warmOrange.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 35))
            VStack(alignment: .leading, spacing: 4) {
                Text("ooooo")
                    .foregroundStyle(.primary)
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("oo")
                    .foregroundStyle(.secondary)
                    .font(.callout)
            }
            Spacer()
        }
        .padding(18)
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 120)
        .background(.darkWhite)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 5)
    }
}


#Preview {
    StreakView()
}
