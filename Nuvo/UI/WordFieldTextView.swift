//
//  FieldTextView.swift
//  Nuvo
//
//  Created by Anastasia on 17.06.2026.
//

import SwiftUI

enum WordFieldMode {
    case add
    case edit
}

struct WordFieldTextView: View {
    let mode: WordFieldMode
    let title: String
    let imageInTextField: Image
    @Binding var text: String
    let submitLabel: SubmitLabel
    let characterLimit = 255
    let onSubmit: () -> Void
    
    init(
        mode: WordFieldMode,
        title: String,
        imageInTextField: Image,
        text: Binding<String>,
        submitLabel: SubmitLabel = .return,
        onSubmit: @escaping () -> Void = {}
    ) {
        self.mode = mode
        self.title = title
        self.imageInTextField = imageInTextField
        self._text = text
        self.submitLabel = submitLabel
        self.onSubmit = onSubmit
    }
    
    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                RoundedRectangle(cornerRadius: 6)
                    .frame(width: 26, height: 26)
                    .foregroundStyle(Color.warmOrange.opacity(0.2))
                    
                imageInTextField
                    .foregroundStyle(.orange)
            }
            TextField(title, text: $text)
                .submitLabel(submitLabel)
                .onSubmit(onSubmit)
            
            if mode == .edit {
                Image(systemName: "pencil")
                    .foregroundStyle(.orange)
            }
        }
                .padding(.horizontal, 18)
                .frame(maxWidth: .infinity)
                .frame(height: 78)
                .background(Color.warmOrange.opacity(0.02))
                .clipShape(RoundedRectangle(cornerRadius: 24))
                .overlay(
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(Color.warmOrange.opacity(0.5), lineWidth: 1))
                .padding(.horizontal)
                .onChange(of: text) { _, newValue in
                    if newValue.count > characterLimit {
                        text = String(newValue.prefix(characterLimit))
                    }
                }
   }
}

