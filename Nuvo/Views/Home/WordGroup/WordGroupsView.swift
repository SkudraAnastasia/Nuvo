//
//  WordGroupsView.swift
//  Nuvo
//
//  Created by Anastasia on 01.07.2026.
//

import SwiftUI

struct WordGroupsView: View {
    @StateObject private var wordGroupsViewModel = WordGroupsViewModel()
    
    private let colums = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12)
    ]
    
    var body: some View {
        
        ScrollView {
            LazyVGrid(columns: colums, spacing: 12) {
                ForEach(wordGroupsViewModel.groups) { group in
                    NavigationLink {
                        WordGroupDetailView(
                            wordGroupsViewModel: wordGroupsViewModel,
                            groupID: group.id
                            )
                    } label: {
                        VStack(alignment: .leading, spacing: 8) {
                            GroupCardView(
                                title: group.title,
                                emoji: group.emoji,
                                wordCount: group.words.count,
                                color: group.color?.groupColor
                            )
                        }
                        .navigationTitle("Groups")
                        .frame(maxWidth: .infinity, minHeight: 100, alignment: .topLeading)
                        .padding()
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .shadow(color: .black.opacity(0.08), radius: 8, x: 0, y: 4)
                    }
                    .buttonStyle(.plain)
                    .contextMenu {  //потом вынести
                        if !group.isSystem {
                            Button(role: .destructive) {
                                wordGroupsViewModel.requestDeleteGroup(group: group)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .background(.orangeBackground.opacity(0.6))
        .alert(
            "Delete this group?",
            isPresented: $wordGroupsViewModel.isDeleteConfirmationShowing
        ) {
            Button("Delete", role: .destructive) {
                wordGroupsViewModel.confirmDeleteGroup()
            }
        }
        .sheet(isPresented: $wordGroupsViewModel.isAddGroupViewIsShowing) {
            addGroupSheet
        }
        .toolbar {
            topToolbar
        }
    }
}

#Preview {
    WordGroupsView()
}

extension WordGroupsView {
    var addGroupSheet: some View {
        NavigationStack {
            AddGroupView(onSave: { title in
                let newGroup = WordGroupModel(title: title, words: [], isSystem: false)
                wordGroupsViewModel.addGroup(newGroup: newGroup) })
                .blur(radius: 0)
                .presentationDetents([.fraction(0.80)])
                .presentationBackground(.white)
                .presentationDragIndicator(.automatic)
        }
    }
}

private extension WordGroupsView {
    
    @ToolbarContentBuilder
    var topToolbar: some ToolbarContent {
        
        ToolbarItemGroup(placement: .topBarTrailing) {
            Button {
                wordGroupsViewModel.isAddGroupViewIsShowing = true
            } label: {
                Image(systemName: "plus")
            }
            
            Menu {
                Button {} label: {
                    Label("Edit", systemImage: "pencil")
                }
                Button(role: .destructive) {} label: {
                    Label("Delete", systemImage: "trash")
                }
            } label: {
                Image(systemName: "ellipsis.circle")
            }
        }
    }
}
