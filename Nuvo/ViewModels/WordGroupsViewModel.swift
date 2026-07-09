//
//  WordGroupsViewModel.swift
//  Nuvo
//
//  Created by Anastasia on 01.07.2026.
//
import Foundation
import SwiftUI
import Combine

final class WordGroupsViewModel: ObservableObject {
    @Published var groups: [WordGroupModel] = MockData.groups
    @Published var isAddGroupViewIsShowing = false
    
    func addGroup(newGroup: WordGroupModel) {
        groups.append(newGroup)
    }
    
    func deleteGroup() {
        
    }
    
    func sortGroups() {}
    
    func group(with id: WordGroupModel.ID) -> WordGroupModel? {
        groups.first { $0.id == id }
    }
    
    func addWord(to groupID: WordGroupModel.ID, word: WordModel) {
        guard let index = groups.firstIndex(where: { $0.id == groupID }) else { return }
        groups[index].words.append(word)
    }

    func deleteWords(from groupID: WordGroupModel.ID, ids: Set<WordModel.ID> ) {
        guard let index = groups.firstIndex(where: { $0.id == groupID }) else { return }
        groups[index].words.removeAll { ids.contains($0.id) }
    }

    func deleteAll() {}

    func sortWords(in groupID: WordGroupModel.ID) {
        guard let index = groups.firstIndex(where: { $0.id == groupID }) else { return }
        groups[index].words.sort { $0.word < $1.word }
    }
    
}



