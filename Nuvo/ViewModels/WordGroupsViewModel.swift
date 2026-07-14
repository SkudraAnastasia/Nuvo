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
    @Published var groups: [WordGroupModel] = DefaultGroups.defaultGroups
    @Published var isAddGroupViewIsShowing = false
    @Published var groupPendingDeletion: WordGroupModel?
    @Published var isDeleteConfirmationShowing = false
    
    func addGroup(newGroup: WordGroupModel) {
        groups.append(newGroup)
    }
    
    func requestDeleteGroup(group: WordGroupModel) {
        guard !group.isSystem else { return }
        groupPendingDeletion = group
        isDeleteConfirmationShowing = true
    }
    
    func confirmDeleteGroup() {
        guard let groupPendingDeletion else { return }
        groups.removeAll { group in
            group.id == groupPendingDeletion.id && !group.isSystem
        }
        self.groupPendingDeletion = nil
        isDeleteConfirmationShowing = false
    }
    
    func cancelDeletion() {
        self.groupPendingDeletion = nil
        isDeleteConfirmationShowing = false
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
    
    func updateWord(
        in groupID: WordGroupModel.ID,
        wordID: WordModel.ID,
        newWord: String,
        newTranslation: String
    ) {
        guard let groupIndex = groups.firstIndex(where: { $0.id == groupID }) else { return }
        guard let wordIndex = groups[groupIndex].words.firstIndex(where: { $0.id == wordID }) else { return }
                                                                  
        groups[groupIndex].words[wordIndex].word = newWord
        groups[groupIndex].words[wordIndex].translation = newTranslation
    }
}




