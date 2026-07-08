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
    @Binding var group: WordGroupModel
    @Published var selectedItems = Set<WordModel.ID>()
    @Published var deleteMode: EditMode = .inactive
    @Published var isAddWordViewIsShowing = false
    
    var isDeleteDisabled: Bool {
        selectedItems.isEmpty
    }
    var isSelectionActive: Bool {
        deleteMode == .active
    }
    
    init(group: Binding<WordGroupModel>) {
        self._group = group
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

    func deleteSelectedItems() {
        withAnimation {
            group.words.removeAll() {selectedItems.contains($0.id) }
            selectedItems.removeAll()
            deleteMode = .inactive
        }
    }
    
    func addWord(word: WordModel) {
        group.words.append(word)
    }
    
    func deleteWord(at offsets: IndexSet) {
        group.words.remove(atOffsets: offsets)
    }
    
    func deleteAll() {
        group.words.removeAll()
    }
    
    func sortWords() {
        group.words.sort { $0.word < $1.word }
    }
}
