//
//  FlashcardView.swift
//  Nuvo
//
//  Created by Anastasia on 04.08.2026.
//

import SwiftUI

struct FlashcardsView: View {
    @StateObject private var flashcardsViewModel: FlashcardsViewModel
    @State private var dragOffset: CGSize = .zero
    
    init(words: [WordModel]) {
        _flashcardsViewModel = StateObject(
            wrappedValue: FlashcardsViewModel(words: words)
        )
    }
    
    var body: some View {
        VStack(spacing: 12) {
            ProgressView(progress: flashcardsViewModel.progressValue)
                .padding(.horizontal, 30)
                .padding(.top, 20)
            Text(flashcardsViewModel.progressText)
                .foregroundStyle(.darkBrown)
                .font(.headline)
            ZStack {
                RoundedRectangle(cornerRadius: 26)
                       .fill(.darkWhite.opacity(0.55))
                       .frame(width: 285, height: 380)
                       .offset(x: 18, y: 18)
                       .shadow(color: .black.opacity(0.04), radius: 6)

                   RoundedRectangle(cornerRadius: 26)
                       .fill(.darkWhite.opacity(0.75))
                       .frame(width: 292, height: 380)
                       .offset(x: 9, y: 9)
                       .shadow(color: .black.opacity(0.05), radius: 6)
                
                FlashCardView(
                    text: flashcardsViewModel.cardText,
                    isTranslationShown: flashcardsViewModel.isTranslationShown,
                    onTap: {
                        flashcardsViewModel.toggleTranslation()
                    }
                )
                .offset(dragOffset)
                .rotationEffect(.degrees(Double(dragOffset.width / 18)))
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            dragOffset = value.translation
                        }
                        .onEnded { value in
                            if value.translation.width < -80 {
                                withAnimation(.spring(response: 0.35, dampingFraction: 0.85)) {
                                    dragOffset = CGSize(width: -600, height: value.translation.height)
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                    flashcardsViewModel.nextCard()
                                    dragOffset = .zero
                                }
                            } else if value.translation.width > 80 {
                                withAnimation(.spring(response: 0.35, dampingFraction: 0.85)) {
                                    dragOffset = CGSize(width: 600, height: value.translation.height)
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                    flashcardsViewModel.previousCard()
                                    dragOffset = .zero
                                }
                        
                            } else {
                                withAnimation(.spring(response: 0.35, dampingFraction: 0.85)) {
                                    dragOffset = .zero
                                }
                            }
                        }
                )
            }
            .padding(.top, 30)
            
            //анимация на свайпы
            Spacer()
            
        }
        .background(Color.orangeBackground)
        .navigationTitle(PracticeMode.flashcards.title)
    }
}

#Preview {
    FlashcardsView(words: [WordModel(word: "хуй", translation: "писька"), WordModel(word: "rgvbrtb", translation: "efv3ef"), WordModel(word: "хуй", translation: "писька"), WordModel(word: "ааааааааааааааааааааааааааааааааааааа", translation: "писька"), WordModel(word: "иии", translation: "писька"), WordModel(word: "хуй", translation: "писька"), WordModel(word: "хуй", translation: "писька"), ])
}
