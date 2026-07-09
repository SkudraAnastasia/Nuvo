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
            LazyVGrid(columns: colums, spacing: 8) {
                ForEach(wordGroupsViewModel.groups) { group in
                    NavigationLink {
                        WordGroupDetailView(
                            wordGroupsViewModel: wordGroupsViewModel,
                            groupID: group.id
                            )
                    } label: {
                        VStack(alignment: .leading, spacing: 8) {
                            Text(group.title)
                                .foregroundStyle(.primary)
                                .font(.headline)
                            Text("\(group.words.count) words")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                        .frame(maxWidth: .infinity, minHeight: 100, alignment: .topLeading)
                        .padding()
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .shadow(color: .black.opacity(0.08), radius: 8, x: 0, y: 4)
                    }
                   .buttonStyle(.plain)
                }
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .sheet(isPresented: $wordGroupsViewModel.isAddGroupViewIsShowing) {
            addGroupSheet
        }
        .toolbar {
            Button {
                wordGroupsViewModel.isAddGroupViewIsShowing = true
            } label: {
                Image(systemName: "plus")
            }
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
                .presentationDetents([.large])
                .presentationBackground(.white)
        }
    }
}
