//
//  HomeView.swift
//  Nuvo
//
//  Created by Anastasia on 15.06.2026.
//

import SwiftUI

struct WordGroupDetailView: View {
    @StateObject private var wordGroupDetailViewModel = WordGroupDetailViewModel()
    @ObservedObject var wordGroupsViewModel: WordGroupsViewModel
    let groupID: WordGroupModel.ID
    private var group: WordGroupModel? {
        wordGroupsViewModel.group(with: groupID)
    }
    
    var body: some View {
        Group {
            if let group {
                List(group.words, selection: $wordGroupDetailViewModel.selectedItems) { word in
                    VStack(alignment: .leading, spacing: 4) {
                        Text(word.word)
                            .font(.headline)
                        
                        Text(word.translation)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                }
                .navigationTitle(group.title)
            } else {
                ContentUnavailableView("Group not found", systemImage: "folder")
            }
        }
            .environment(\.editMode, $wordGroupDetailViewModel.deleteMode)
            .toolbar(wordGroupDetailViewModel.isSelectionActive ? .hidden : .visible, for: .tabBar)
            .safeAreaInset(edge: .bottom,  content: {  /////
                if !wordGroupDetailViewModel.isSelectionActive {
                    LargeButtonView(title: "Start", color: .blue, action: {})
                        .padding(.bottom, 24)
                }
            })
            .toolbar {
                topToolbar
                bottomToolbar
            }
            .sheet(isPresented: $wordGroupDetailViewModel.isAddWordViewIsShowing) {
                addWordSheet
        }
    }
}

//MARK: Toolbar
private extension WordGroupDetailView {
    
    @ToolbarContentBuilder
    var topToolbar: some ToolbarContent {
        
        ToolbarItemGroup(placement: .topBarTrailing) {
            Button(action: {
                wordGroupDetailViewModel.isAddWordViewIsShowing = true
            }){
                Image(systemName: "plus")
            }
            Menu {
                Button {} label: {
                    Label("Sort A-Z", systemImage: "arrow.up")
                }
                Button {} label: {
                    Label("Edit", systemImage: "pencil")
                }
                Button(role: .destructive) { wordGroupDetailViewModel.startSelection() } label: {
                    Label("Delete", systemImage: "trash")
                }
            } label: {
                Image(systemName: "ellipsis.circle")
            }
        }
    }
    
    @ToolbarContentBuilder
    var bottomToolbar: some ToolbarContent {
        ToolbarItemGroup(placement: .bottomBar) {
            if wordGroupDetailViewModel.isSelectionActive {
                HStack {
                    Button() {
                        wordGroupDetailViewModel.cancelSelection()
                    } label: {
                        Text("Cancel")
                            .bold()
                    }
                    .frame(width: 100, height: 50)
                    .padding(.trailing, 24)
                    
                    Button(role: .destructive) {
                        wordGroupsViewModel.deleteWords(
                            from: groupID,
                            ids: wordGroupDetailViewModel.selectedItems
                        )
                        wordGroupDetailViewModel.finishSelection()
                    } label: {
                        Text("Delete (\(wordGroupDetailViewModel.selectedItems.count))")
                            .bold()
                            .foregroundStyle(wordGroupDetailViewModel.isDeleteDisabled
                                             ? .gray
                                             : .red
                            )
                    }
                    .frame(width: 100, height: 50)
                    .padding(.leading, 24)
                }
            }
        }
    }
    
    var addWordSheet: some View {
        NavigationStack {
            AddWordView(onSave: { word, translation in
                let newWord = WordModel(word: word, translation: translation)
                wordGroupsViewModel.addWord(to: groupID, word: newWord)
            })
            .blur(radius: 0)
            .presentationDetents([.medium])
            .presentationBackground(.white)
        }
    }
}

#Preview {
    let viewModel = WordGroupsViewModel()

    NavigationStack {
        WordGroupDetailView(
            wordGroupsViewModel: viewModel,
            groupID: viewModel.groups[0].id
        )
    }
}
