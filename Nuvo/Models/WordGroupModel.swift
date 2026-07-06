//
//  WordGroupModel.swift
//  Nuvo
//
//  Created by Anastasia on 01.07.2026.
//
import Foundation

struct WordGroupModel: Identifiable {
    let id = UUID()
    var title: String
    var words: [WordModel]
    var isSystem: Bool
}
