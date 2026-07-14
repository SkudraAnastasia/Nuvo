//
//  WordGroupDetailViewModel.swift
//  Nuvo
//
//  Created by Anastasia on 15.06.2026.
//
import SwiftUI
import Foundation
import Combine

final class WordGroupDetailViewModel: ObservableObject {
    @Published var selectedItems = Set<WordModel.ID>()
    @Published var deleteMode: EditMode = .inactive
    @Published var isAddWordViewIsShowing = false
    @Published var wordPendingEditing: WordModel?
    
    var isDeleteDisabled: Bool {
        selectedItems.isEmpty
    }
    var isSelectionActive: Bool {
        deleteMode == .active
    }
    
    func startSelection() {
        withAnimation {
            deleteMode = .active
        }
    }
    
    func cancelSelection() {
        withAnimation {
            deleteMode = .inactive
            selectedItems.removeAll()
        }
    }

    func finishSelection() {
        withAnimation {
            selectedItems.removeAll()
            deleteMode = .inactive
        }
    }
    
    func startEditing(word: WordModel) {
        wordPendingEditing = word
    }
    
    func finishEditing() {
        wordPendingEditing = nil
    }
    
    func saveEditedWord(
        wordID: WordModel.ID,
        newWord: String,
        newTranslation: String,
        viewModel: WordGroupsViewModel,
        in groupID: WordGroupModel.ID
    ) {
        viewModel.updateWord(
            in: groupID,
            wordID: wordID,
            newWord: newWord,
            newTranslation: newTranslation
        )
        finishEditing()
    }
}
