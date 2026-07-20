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

    var body: some View {

        VStack(spacing: 16) {
            Text("Add new group")
                .font(.headline)
                .padding()
            
            Spacer()
            
            WordFieldTextView(
                title: "Enter title",
                imageInTextField: Image(systemName: "character.book.closed"),
                text: Binding(
                    get: { addGroupViewModel.title },
                    set: { addGroupViewModel.updateTitle(newValue:($0)) }
                )
            )
                .padding(.vertical)
            
            ButtonView(type: .primary, title: "Save", action: saveTitle)
        }
    }
    private func saveTitle() {
        guard addGroupViewModel.canSave else { return }
        onSave(addGroupViewModel.trimmedTitle)
        dismiss()
    }
}


#Preview {
    AddGroupView(onSave: { title in
        let newGroup = WordGroupModel(title: title, words: [], isSystem: false)})
    }

