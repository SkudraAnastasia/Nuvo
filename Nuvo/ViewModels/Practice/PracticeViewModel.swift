//
//  PracticeViewModel.swift
//  Nuvo
//
//  Created by Anastasia on 29.07.2026.
//
import Foundation
import Combine

final class PracticeViewModel: ObservableObject {
    @Published var selectedMode: PracticeMode?
    @Published var selectedGroupID: WordGroupModel.ID?
    
    var modes: [PracticeMode] {
        PracticeMode.allCases
    }
}
