//
//  PracticeHomeView.swift
//  Nuvo
//
//  Created by Anastasia on 29.07.2026.
//

import SwiftUI

struct PracticeView: View {
    @StateObject private var practiceViewModel = PracticeViewModel()
    @ObservedObject var wordGroupsViewModel: WordGroupsViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Practice")
                .font(.title)
                .foregroundStyle(.primary)
                .fontWeight(.semibold)
                .padding(.horizontal)
            
            StreakView()
                .padding(.horizontal)
            
            HStack(spacing: 12) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        GroupFilterChipView(
                            title: "All",
                            emoji: "🌎",
                            isSelected: practiceViewModel.allGroupsSelected,
                            action: {
                                practiceViewModel.selectAllGroups()
                            }
                        )
                        ForEach(wordGroupsViewModel.groups) { group in
                            GroupFilterChipView(
                                title: group.title,
                                emoji: group.emoji ?? "",
                                isSelected: practiceViewModel.isSelected(group),
                                action: {
                                    practiceViewModel.toggleGroup(group)
                                }
                            )
                        }
                    }
                    .frame(height: 50)
                }
                .contentMargins(.horizontal, 16, for: .scrollContent)
            }
        
            Text("Choose a workout")
                .font(.title2)
                .foregroundStyle(.primary)
                .fontWeight(.semibold)
                .padding(.horizontal)
            
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(practiceViewModel.modes) { mode in
                        Button {
                            practiceViewModel.selectedMode = mode
                        } label: {
                            PracticeModeCardView(mode: mode)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .background(.clear)
            }
            .padding(.horizontal)
        }
        .background(.orangeBackground.opacity(0.6))
        .navigationDestination(item: $practiceViewModel.selectedMode) { mode in
            switch mode {
            case .flashcards: FlashcardsView()
            case .matchWords: Text("")
            case .typeAnswer: Text("")
            case .express: Text("")
            }
        }
    }
}

#Preview {
    NavigationStack {
        PracticeView(wordGroupsViewModel: WordGroupsViewModel())
    }
}

private extension PracticeView {
    
}

