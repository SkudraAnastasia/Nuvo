//
//  PracticeHomeView.swift
//  Nuvo
//
//  Created by Anastasia on 29.07.2026.
//

import SwiftUI

struct PracticeView: View {
    @StateObject private var practiceViewModel = PracticeViewModel()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                ForEach(practiceViewModel.modes) { mode in
                    PracticeModeCardView(mode: mode)
                }
            }
            .background(.white)
        }
        .background(Color(.orange).opacity(0.1))
    }
}

#Preview {
    PracticeView()
}

private extension PracticeView {
    
}
