//
//  WordGroupsViewModel.swift
//  Nuvo
//
//  Created by Anastasia on 01.07.2026.
//
import Foundation
import SwiftUI
import Combine

final class WordGroupsViewModel: ObservableObject {
    @Published var groups: [WordGroupModel] = MockData.groups
    
    func addGroup(newGroup: WordGroupModel) {
        groups.append(newGroup)
    }
    
    func deleteGroup() {
        
    }
    
    func sortGroups() {}
    
}
