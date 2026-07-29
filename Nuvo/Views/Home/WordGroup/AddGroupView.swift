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

        VStack(spacing: 6) {
            Image("Categories")
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
                .padding(.top, 26)
            
            Text("New group")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.bottom)
            
            Text("What words will this group hold?")
                .font(.headline)
                .foregroundStyle(.primary)
            Text("For example: travel, food, hobbies, or study")
                .foregroundStyle(.separator)
                .font(.subheadline)
            
            WordFieldTextView(
                mode: .add,
                title: "Enter title",
                imageInTextField: Image(systemName: "character.book.closed"),
                text: Binding(
                    get: { addGroupViewModel.title },
                    set: { addGroupViewModel.updateTitle(newValue:($0)) }
                ),
                submitLabel: .next,
                onSubmit: { saveTitle() }
            )
                .padding(.vertical)
            
            Spacer()
            
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

