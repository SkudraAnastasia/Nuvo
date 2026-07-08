//
//  AddGroupView.swift
//  Nuvo
//
//  Created by Anastasia on 06.07.2026.
//

import SwiftUI

struct AddGroupView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var addGroupViewModel = AddGroupViewModel()
    let onSave: (String) -> Void
    
    private let colums = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12)
    ]
    
    var body: some View {

        LazyVGrid(columns: colums, spacing: 8) {
            ForEach(addGroupViewModel.defaultGroups) { group in
                Button {
                    addGroupViewModel.title = group.title
                } label: {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(group.title)
                            .foregroundStyle(.primary)
                            .font(.headline)
                    }
                    .frame(maxWidth: .infinity, minHeight: 100, alignment: .topLeading)
                    .padding()
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .shadow(color: .black.opacity(0.08), radius: 8, x: 0, y: 4)
                }
            }
               .buttonStyle(.plain)
            }
        .padding()
    .background(Color(.systemGroupedBackground))
    
        VStack(spacing: 16) {
            Text("Add new group")
                .font(.largeTitle)
                .padding()
            
            Spacer()
            
            WordFieldTextView(title: "Enter title", text: $addGroupViewModel.title)
                .padding(.vertical)
            
            LargeButtonView(title: "Save", color: .blue, action: saveTitle)
        }
    }
    private func saveTitle() {
        guard addGroupViewModel.canSave else { return }
        onSave(addGroupViewModel.title)
        dismiss()
    }
}


#Preview {
    AddGroupView(onSave: { title in
        let newGroup = WordGroupModel(title: title, words: [], isSystem: false)})
    }

