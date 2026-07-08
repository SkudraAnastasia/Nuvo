//
//  AddWordView.swift
//  Nuvo
//
//  Created by Anastasia on 07.07.2026.
//
import Foundation
import Combine

final class AddWordViewModel: ObservableObject {
    @Published var word = ""
    @Published var translation = ""

    var trimmedWord: String {
        word.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    var trimmedTranslation: String {
        translation.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    var canSave: Bool {
        !trimmedWord.isEmpty && !trimmedTranslation.isEmpty
    }

    func clearFields() {
        word = ""
        translation = ""
    }
}
