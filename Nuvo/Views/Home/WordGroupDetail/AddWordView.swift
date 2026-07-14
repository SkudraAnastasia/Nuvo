//
//  AddWordView.swift
//  Nuvo
//
//  Created by Anastasia on 17.06.2026.
//

import SwiftUI


struct AddWordView: View {
    @StateObject private var addWordViewModel = WordFormViewModel()
    @Environment(\.dismiss) private var dismiss
    @FocusState private var focusedField: FocusedField?
    
    let onSave: (String, String) -> Void

    
    var body: some View {
        
        VStack() {
            
            Spacer()
            
            Text("Add new words")
                .font(.default)
            
            Spacer()

            WordFieldTextView(title: "Enter word", text: $addWordViewModel.word)
                .focused($focusedField, equals: .word)
                .padding(.vertical)
            WordFieldTextView(title: "Enter translation", text: $addWordViewModel.translation)
                .focused($focusedField, equals: .translation)
            
            Spacer()
            
            LargeButtonView(title: "Add more", colors: [.green, .cyan], action: addMore)
            LargeButtonView(title: "Save", colors: [.orange, .yellow], action: saveWord)
        }
    }
    
    private func addMore() {
        guard addWordViewModel.canSave else { return }
        onSave(addWordViewModel.trimmedWord, addWordViewModel.trimmedTranslation)
        addWordViewModel.clearFields()
        DispatchQueue.main.async {
            focusedField = .word
        }
   
    }
    
    private func saveWord() {
        guard addWordViewModel.canSave else { return }
        onSave(addWordViewModel.trimmedWord, addWordViewModel.trimmedTranslation)
        dismiss()
    }
}

#Preview {
    AddWordView(onSave: { (hui, popa) in
    })
}
