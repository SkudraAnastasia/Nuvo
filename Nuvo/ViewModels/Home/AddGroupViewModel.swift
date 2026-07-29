//
//  AddGroupViewModel.swift
//  Nuvo
//
//  Created by Anastasia on 07.07.2026.
//
import Foundation
import Combine

final class AddGroupViewModel: ObservableObject {
    @Published var title = ""
    private let maxTitleSymbols = 24
    
    var canSave: Bool {
        !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    var trimmedTitle: String {
        title.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func updateTitle(newValue: String) {
        if newValue.count < maxTitleSymbols {
            title = newValue
        } else {
            title = String(newValue.prefix(maxTitleSymbols))
        }
    }
}
