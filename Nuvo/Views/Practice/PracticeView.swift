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
            VStack(alignment: .leading, spacing: 12) {
                Text("Practice")
                    .font(.title)
                    .foregroundStyle(.primary)
                    .fontWeight(.semibold)
                
                StreakView()
                    .padding(.bottom)
                
                Text("Choose a workout")
                    .font(.title2)
                    .foregroundStyle(.primary)
                    .fontWeight(.semibold)
                
                ForEach(practiceViewModel.modes) { mode in
                    PracticeModeCardView(mode: mode)
                }
                
                Text("Practice from")
                    .padding(.top)
                    .font(.callout)
                    .foregroundStyle(.primary)
                    .fontWeight(.semibold)
                
                //foreach cс группами
            }
            .padding()
            .background(.clear)
        }
        .padding(.horizontal, 4)
        .background(.orangeBackground.opacity(0.6))
    }
}

#Preview {
    PracticeView()
}

private extension PracticeView {
    
}
