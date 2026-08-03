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
    @Published var selectedGroupID: WordGroupModel.ID?
    
    var modes: [PracticeMode] {
        PracticeMode.allCases
    }
    
    var allGroupsSelected: Bool {
        selectedGroupID == nil
    }
    
    func selectAllGroups() {
        selectedGroupID = nil
    }
    
    func selectGroup(_ group: WordGroupModel) {
        selectedGroupID = group.id
    }
    
    func isSelected(_ group: WordGroupModel) -> Bool {
        selectedGroupID == group.id
    }
}
