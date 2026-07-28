//
//  GroupCardView.swift
//  Nuvo
//
//  Created by Anastasia on 27.07.2026.
//

import SwiftUI

struct GroupCardView: View {
    let title: String
    let emoji: String?
    let wordCount: Int
    let color: Color?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            HStack {
                if let emoji  {
                    Text(emoji)
                        .font(.system(size: 28))
                        .frame(width: 54, height: 54)
                        .background((color ?? .warmOrange).opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 27))
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundStyle(.orange)
            }
            
            Spacer()
            
            Text(title)
                .foregroundStyle(.primary)
                .font(.headline)
            Text("\(wordCount) words")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    GroupCardView(title: "Aaaa", emoji: "✈️", wordCount: 5, color: .blue)
}
