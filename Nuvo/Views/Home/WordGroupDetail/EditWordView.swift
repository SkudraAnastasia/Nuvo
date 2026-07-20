//
//  EditWordView.swift
//  Nuvo
//
//  Created by Anastasia on 13.07.2026.
//

import SwiftUI

struct EditWordView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var editWordViewModel: WordFormViewModel
    
    private var onSave: (String, String) -> Void
    
    init(word: WordModel, onSave: @escaping (String, String) -> Void) {
        _editWordViewModel = StateObject(wrappedValue: WordFormViewModel(
            word: word.word,
            translation: word.translation
            )
        )
        self.onSave = onSave
    }
    
    var body: some View {
        
        VStack() {
            
            Spacer()
            
            Text("Edit word")
                .font(.default)
            
            Spacer()

            WordFieldTextView(
                    title: "Enter word",
                    imageInTextField: Image(systemName: "character.book.closed"),
                    text: $editWordViewModel.word)
                .padding(.vertical)
            WordFieldTextView(
                title: "Enter translation",
                imageInTextField: Image(systemName: "globe"),
                text: $editWordViewModel.translation)
            
            Spacer()
            
            ButtonView(type: .primary, title: "Save", action: saveWord)
        }
    }
    
    func saveWord() {
        guard editWordViewModel.canSave else { return }
        
        onSave(
            editWordViewModel.trimmedWord,
            editWordViewModel.trimmedTranslation
        )
        dismiss()
    }
}

#Preview {
    EditWordView(word: WordModel(word: "hui", translation: "piska"), onSave: { (hui, piska) in })
}
