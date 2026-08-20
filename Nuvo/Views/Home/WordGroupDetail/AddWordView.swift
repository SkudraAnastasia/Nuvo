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
        ScrollView {
            VStack(spacing: 18) {
                
                HStack {
                    Image("AddWordBook")
                        .resizable()
                        .frame(width: 110, height: 110)
                        .clipShape(RoundedRectangle(cornerRadius: 18))
                        .padding(.trailing, 12)
                    
                    
                    VStack(spacing: 14) {
                        Text("New word")
                            .fontWeight(.semibold)
                            .font(.largeTitle)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("Add a word and translation to your vocabulary")
                            .fontWeight(.light)
                            .font(.callout)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.vertical, 40)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 24)
                
                
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 50, height: 6)
                        .foregroundStyle(.warmOrange)
                    
                    Circle()
                        .frame(width: 6, height: 6)
                        .foregroundStyle(.warmOrange)
                }
                .offset(x: -26, y: -26)
                
                WordFormFieldsView(
                    word: $addWordViewModel.word,
                    translation: $addWordViewModel.translation,
                    mode: .add,
                    focusedField: $focusedField,
                    onSave: saveWord,
                    onAddAnother: addMore
                    )
            }
            .padding(.vertical, 24)
        }
        .contentShape(Rectangle())
        .onTapGesture {
            focusedField = nil
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
