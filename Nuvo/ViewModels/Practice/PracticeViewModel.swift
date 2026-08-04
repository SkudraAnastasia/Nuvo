//
//  PracticeViewModel.swift
//  Nuvo
//
//  Created by Anastasia on 29.07.2026.
//
import Foundation
import Combine

final class PracticeViewModel: ObservableObject {
    @Published var selectedMode: PracticeMode?
    @Published var selectedGroupIDs: Set<WordGroupModel.ID> = []
    
    var modes: [PracticeMode] {
        PracticeMode.allCases
    }
    
    var allGroupsSelected: Bool {
        selectedGroupIDs.isEmpty
    }
    
    func selectAllGroups() {
        selectedGroupIDs.removeAll()
    }
    
    func selectGroup(_ group: WordGroupModel) {
        selectedGroupIDs.insert(group.id)
    }
    
    func isSelected(_ group: WordGroupModel) -> Bool {
        selectedGroupIDs.contains(group.id)
    }
    
    func toggleGroup(_ group: WordGroupModel) {
        if selectedGroupIDs.contains(group.id) {
            selectedGroupIDs.remove(group.id)
        } else {
            selectGroup(group)
        }
    }
    
    func wordsForPractice(from groups: [WordGroupModel]) -> [WordModel] {
        if allGroupsSelected {
            groups.flatMap { $0.words }
        } else {
            groups
                .filter { selectedGroupIDs.contains($0.id) }
                .flatMap { $0.words }
        }
    }
}


