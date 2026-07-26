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
                wordList(for: group)
                    .buttonStyle(.plain)
                    .navigationTitle(group.title)
                } else {
                    ContentUnavailableView("Group not found", systemImage: "folder")
                }
            }
        .environment(\.editMode, $wordGroupDetailViewModel.deleteMode)
        .toolbar(wordGroupDetailViewModel.isSelectionActive ? .hidden : .visible, for: .tabBar)
        .safeAreaInset(edge: .bottom,  content: {  /////
            if !wordGroupDetailViewModel.isSelectionActive {
                ButtonView(type: .primary, title: "Start", action: {})
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
        .sheet(item: $wordGroupDetailViewModel.wordPendingEditing) { word in
            EditWordView(word: word, onSave: { newWord, newTranslation in
                wordGroupDetailViewModel.saveEditedWord(
                    wordID: word.id,
                    newWord: newWord,
                    newTranslation: newTranslation,
                    viewModel: wordGroupsViewModel,
                    in: groupID)
            })
            .presentationDetents([.medium])
            .presentationDragIndicator(.automatic)
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
                Menu {
                    Button {
                        wordGroupDetailViewModel.sortMode = .newestFirst
                    } label: {
                        Label(
                            "Newest first",
                            systemImage: wordGroupDetailViewModel.isSelectedSortMode(mode: .newestFirst)
                                ? "checkmark.circle.fill"
                                : "calendar.badge.clock"
                        )
                    }
                    .tint(wordGroupDetailViewModel.sortMode == .newestFirst ? .orange : .primary)
                    
                    Button {
                        wordGroupDetailViewModel.sortMode = .oldestFirst
                    } label: {
                        Label(
                            "Oldest first",
                            systemImage: wordGroupDetailViewModel.isSelectedSortMode(mode: .oldestFirst)
                                ? "checkmark.circle.fill"
                                : "calendar"
                        )
                    }
                    .tint(wordGroupDetailViewModel.sortMode == .oldestFirst ? .orange : .primary)

                    Button {
                        wordGroupDetailViewModel.sortMode = .alphabeticalAscending
                    } label: {
                        Label(
                            "A-Z",
                            systemImage: wordGroupDetailViewModel.isSelectedSortMode(mode: .alphabeticalAscending)
                                ? "checkmark.circle.fill"
                                : "arrow.up"
                        )
                    }
                    .tint(wordGroupDetailViewModel.sortMode == .alphabeticalAscending ? .orange : .primary)

                    Button {
                        wordGroupDetailViewModel.sortMode = .alphabeticalDescending
                    } label: {
                        Label(
                            "Z-A",
                            systemImage: wordGroupDetailViewModel.isSelectedSortMode(mode: .alphabeticalDescending)
                                ? "checkmark.circle.fill"
                                : "arrow.down"
                        )
                    }
                    .tint(wordGroupDetailViewModel.sortMode == .alphabeticalDescending ? .orange : .primary)
                    
                } label: {
                    Label("Sort by", systemImage: "arrow.up")
                }
                
                Button(role: .destructive) {
                    wordGroupDetailViewModel.startSelection()
                } label: {
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
            .presentationDetents([.large])
            .presentationBackground(.white)
            .presentationDragIndicator(.automatic)
        }
    }
}

private extension WordGroupDetailView {
    func wordRow(_ word: WordModel) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(word.word)
                .font(.headline)

            Text(word.translation)
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }
    
    @ViewBuilder
    func wordList(for group: WordGroupModel) -> some View {
        let words = wordGroupDetailViewModel.displayedWords(from: group.words)
        
        if wordGroupDetailViewModel.isSelectionActive {
            List(words, selection: $wordGroupDetailViewModel.selectedItems) { word in
                wordRow(word)
                    .tag(word.id)
            }
        } else {
            List(words) { word in
                Button {
                    wordGroupDetailViewModel.startEditing(word: word)
                } label: {
                    wordRow(word)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .contentShape(Rectangle())
                }
            }
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
