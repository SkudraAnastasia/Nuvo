//
//  WordFieldFormView.swift
//  Nuvo
//
//  Created by Anastasia on 22.07.2026.
//

import SwiftUI

struct WordFormFieldsView: View {
    @Binding var word: String
    @Binding var translation: String
    
    let mode: WordFieldMode
    let focusedField: FocusState<FocusedField?>.Binding
    let onSave: () -> Void
    let onAddAnother: (() -> Void)?
    
    var body: some View {
        
        Text("Word")
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            .fontWeight(.light)
            .padding(.top, 16)
        
        WordFieldTextView(
            mode: .edit,
            title: "Enter word",
            imageInTextField: Image(systemName: "character.book.closed"),
            text: $word,
            submitLabel: .next,
            onSubmit: { focusedField.wrappedValue = .translation }
        )
        .focused(focusedField, equals: .word)
        
       
        Text("Translation")
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            .fontWeight(.light)
        
        WordFieldTextView(
            mode: .edit,
            title: "Enter translation",
            imageInTextField: Image(systemName: "globe"),
            text: $translation,
            submitLabel: .done,
            onSubmit:  { onSave() }
        )
        .focused(focusedField, equals: .translation)
        .padding( .bottom, onAddAnother != nil ? 44 : 18 )
        
        if let onAddAnother {
            ButtonView(
                type: .secondary,
                title: "Add another",
                iconName: "plus",
                action: onAddAnother
            )
        }

        ButtonView(type: .primary, title: "Save", action: onSave)

    }
}
