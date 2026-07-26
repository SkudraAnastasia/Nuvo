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
    @FocusState private var focusedField: FocusedField?
    
    
    private var onSave: (String, String) -> Void
    
    init(
        word: WordModel,
        onSave: @escaping (String, String) -> Void) {
        _editWordViewModel = StateObject(wrappedValue: WordFormViewModel(
            word: word.word,
            translation: word.translation
            )
        )
        self.onSave = onSave
    }
    
    var body: some View {
        VStack(spacing: 18) {
            Text("Edit word")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.top, 28)
            
            WordFormFieldsView(
                word: $editWordViewModel.word,
                translation: $editWordViewModel.translation,
                mode: .edit,
                focusedField: $focusedField,
                onSave: saveWord,
                onAddAnother: nil
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white)
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
