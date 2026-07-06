//
//  HomeView.swift
//  Nuvo
//
//  Created by Anastasia on 15.06.2026.
//

import SwiftUI

struct WordGroupDetailView: View {
    @StateObject private var wordGroupDetailViewModel: WordGroupDetailViewModel
    
    init(group: WordGroupModel) {
        _wordGroupDetailViewModel = StateObject(wrappedValue: WordGroupDetailViewModel(group: group))
    }
    
    var body: some View {
            List(wordGroupDetailViewModel.group.words, selection: $wordGroupDetailViewModel.selectedItems) { word in
                VStack(alignment: .leading, spacing: 4) {
                    Text(word.word)
                        .font(.headline)
                    
                    Text(word.translation)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
            .navigationTitle(wordGroupDetailViewModel.group.title)
            .environment(\.editMode, $wordGroupDetailViewModel.deleteMode)
            .toolbar(wordGroupDetailViewModel.isSelectionActive ? .hidden : .visible, for: .tabBar)
            .safeAreaInset(edge: .bottom,  content: {  /////
                if !wordGroupDetailViewModel.isSelectionActive {
                    LargeButtonView(title: "Start", color: .blue, action: {})
                        .padding(.bottom, 24)
                }
            })
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button(action: { wordGroupDetailViewModel.isAddWordViewIsShowing = true }) {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $wordGroupDetailViewModel.isAddWordViewIsShowing) {
                        NavigationStack {
                            AddWordView(onSave: { word, translation in
                                let newWord = WordModel(word: word, translation: translation)
                                wordGroupDetailViewModel.addWord(word: newWord)})
                            
                                .blur(radius: 0)
                                .presentationDetents([.medium])
                                .presentationBackground(.white)
                        }
                    }
                    
                    Menu { //мошт вынести
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
                                wordGroupDetailViewModel.deleteSelectedItems()
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
    }
}

#Preview {
    WordGroupDetailView(group: MockData.groups[0]
    )
}
