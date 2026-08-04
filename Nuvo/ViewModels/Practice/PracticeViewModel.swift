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
    @Published var selectedGroupID: Set<WordGroupModel.ID> = []
    
    var modes: [PracticeMode] {
        PracticeMode.allCases
    }
    
    var allGroupsSelected: Bool {
        selectedGroupID.isEmpty
    }
    
    func selectAllGroups() {
        selectedGroupID.removeAll()
    }
    
    func selectGroup(_ group: WordGroupModel) {
        selectedGroupID.insert(group.id)
    }
    
    func isSelected(_ groups: WordGroupModel) -> Bool {
        selectedGroupID.contains(groups.id)
    }
    
    func toggleGroup(_ group: WordGroupModel) {
        if selectedGroupID.contains(group.id) {
            selectedGroupID.remove(group.id)
        } else {
            selectGroup(group)
        }
    }
}


