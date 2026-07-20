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
        
        VStack {
            
            Spacer()
            
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundStyle(Color.warmOrange.opacity(0.2))
                        .frame(width: 80, height: 90)
                        .offset(x: -5, y: -3)
                    
                    Image(systemName: "book.badge.plus.fill")
                        .resizable()
                        .frame(width: 60, height: 50)
                        .foregroundStyle(.orange)
                }
                VStack {
                    Text("New Word")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Add a word and translation to your vocabulary")
                        .fontWeight(.light)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 24)
            
            Spacer()
            
            Text("Word")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .fontWeight(.light)

            WordFieldTextView(
                    title: "Enter word",
                    imageInTextField: Image(systemName: "character.book.closed"),
                    text: $addWordViewModel.word)
                .focused($focusedField, equals: .word)
                .padding(.bottom)
            
            Text("Translation")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .fontWeight(.light)
            
            WordFieldTextView(
                    title: "Enter translation",
                    imageInTextField: Image(systemName: "globe"),
                    text: $addWordViewModel.translation)
                .focused($focusedField, equals: .translation)
            
            Spacer()
            
            ButtonView(type: .secondary, title: "Add another", iconName: "plus", action: addMore)
                .padding(.vertical, 8)
            ButtonView(type: .primary, title: "Save", action: saveWord)
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
    AddWordView(onSave: { _, _ in })
}
