//
//  AddGroupViewModel.swift
//  Nuvo
//
//  Created by Anastasia on 07.07.2026.
//
import Foundation
import Combine

enum DefaultGroupTitle: String, CaseIterable, Identifiable {
    
    case travel = "Travel✈️🏖"
    case work = "Work💸💻"
    case food = "Food🥘🍔"
    case study = "Study📒📝"
    case hobbies = "Hobbies🎮🪂"
    case home = "Home🏡🛏"
    
    var id: String { rawValue }
    var title: String { rawValue }
}

final class AddGroupViewModel: ObservableObject {
    @Published var title = ""
    
    let defaultGroups = DefaultGroupTitle.allCases
    
    var canSave: Bool {
        !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    var trimmedTitle: String {
        title.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    func selectDefaultGroup(group: DefaultGroupTitle) {
        title = group.title
    }
}
