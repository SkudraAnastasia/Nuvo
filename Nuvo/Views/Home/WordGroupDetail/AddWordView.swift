//
//  AddWordView.swift
//  Nuvo
//
//  Created by Anastasia on 17.06.2026.
//

import SwiftUI


struct AddWordView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var word = ""
    @State private var translation = ""
    let onSave: (String, String) -> Void
    
    var body: some View {
        
        VStack() {
            
            Spacer()
            
            Text("Add new words")
                .font(.largeTitle)
            
            Spacer()

            WordFieldTextView(title: "Enter word", text: $word)
                .padding(.vertical)
            WordFieldTextView(title: "Enter translation", text: $translation)
            
            Spacer()
            
            LargeButtonView(title: "Add more", color: .green, action: addMore)
            LargeButtonView(title: "Save", color: .blue, action: saveWord)
        }
    }
    private func saveWord() {
        guard !word.isEmpty, !translation.isEmpty else { return }
        onSave(word, translation)
        dismiss()
    }
    private func addMore() {
        guard !word.isEmpty, !translation.isEmpty else { return }
        onSave(word, translation)
        word = ""
        translation = ""
    }
}
