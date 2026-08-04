//
//  chosenGroupCardView.swift
//  Nuvo
//
//  Created by Anastasia on 30.07.2026.
//

import SwiftUI

struct ChosenGroupCardView: View {
    var body: some View {
        HStack {
            Text("🍻")
                .font(.title2)
            Text("hui")
        }
        .padding(2)
        .frame(width: 70, height: 50)
        .background(.darkWhite)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 5)
    }
}

#Preview {
    ChosenGroupCardView()
}
