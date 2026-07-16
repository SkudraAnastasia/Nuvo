//
//  FieldTextView.swift
//  Nuvo
//
//  Created by Anastasia on 17.06.2026.
//

import SwiftUI

struct WordFieldTextView: View {
    let title: String
    let imageInTextField: Image
    @Binding var text: String
    
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
        }
                .padding(.horizontal, 18)
                .frame(maxWidth: .infinity, maxHeight: 78)
                .background(Color.warmOrange.opacity(0.02))
                .clipShape(RoundedRectangle(cornerRadius: 24))
                .overlay(
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(Color.warmOrange.opacity(0.5), lineWidth: 1))
                .padding(.horizontal)
   }
}

