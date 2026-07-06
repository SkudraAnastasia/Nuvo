//
//  MockData.swift
//  Nuvo
//
//  Created by Anastasia on 05.07.2026.
//
import Foundation

enum MockData {
    static let words: [WordModel] = [
        WordModel(word: "Apple", translation: "Яблоко"),
        WordModel(word: "House", translation: "Дом"),
        WordModel(word: "Book", translation: "Книга")
    ]
    
    static let groups: [WordGroupModel] = [
        WordGroupModel(
            title: "Favourites",
            words: words,
            isSystem: true
        ),
        WordGroupModel(
            title: "Travel",
            words: [
                WordModel(word: "Airport", translation: "Аэропорт"),
                WordModel(word: "Ticket", translation: "Билет")
            ],
            isSystem: false
        ),
        WordGroupModel(
            title: "Favourites",
            words: words,
            isSystem: true
        ),
        WordGroupModel(
            title: "Travel Travel",
            words: [
                WordModel(word: "Airport", translation: "Аэропорт"),
                WordModel(word: "Ticket", translation: "Билет")
            ],
            isSystem: false
        ),
        WordGroupModel(
            title: "Favourites",
            words: words,
            isSystem: true
        ),
        WordGroupModel(
            title: "Travel",
            words: [
                WordModel(word: "Airport", translation: "Аэропорт"),
                WordModel(word: "Ticket", translation: "Билет")
            ],
            isSystem: false
        ),
        WordGroupModel(
            title: "Favourites",
            words: words,
            isSystem: true
        ),
        WordGroupModel(
            title: "Travel",
            words: [
                WordModel(word: "Airport", translation: "Аэропорт"),
                WordModel(word: "Ticket", translation: "Билет")
            ],
            isSystem: false
        ),
    ]
}
