//
//  AddWordView.swift
//  Nuvo
//
//  Created by Anastasia on 17.06.2026.
//

import SwiftUI


struct AddWordView: View {
    @StateObject private var addWordViewModel = AddWordViewModel()
    @Environment(\.dismiss) private var dismiss
    
    let onSave: (String, String) -> Void

    
    var body: some View {
        
        VStack() {
            
            Spacer()
            
            Text("Add new words")
                .font(.largeTitle)
            
            Spacer()

            WordFieldTextView(title: "Enter word", text: $addWordViewModel.word)
                .padding(.vertical)
            WordFieldTextView(title: "Enter translation", text: $addWordViewModel.translation)
            
            Spacer()
            
            LargeButtonView(title: "Add more", color: .green, action: addMore)
            LargeButtonView(title: "Save", color: .blue, action: saveWord)
        }
    }
    
    private func addMore() {
        guard addWordViewModel.canSave else { return }
        onSave(addWordViewModel.trimmedWord, addWordViewModel.trimmedTranslation)
        addWordViewModel.clearFields()
   
    }
    
    private func saveWord() {
        guard addWordViewModel.canSave else { return }
        onSave(addWordViewModel.trimmedWord, addWordViewModel.trimmedTranslation)
        dismiss()
    }
}
