//
//  FieldTextView.swift
//  Nuvo
//
//  Created by Anastasia on 17.06.2026.
//

import SwiftUI

struct WordFieldTextView: View {
    let title: String
    @Binding var text: String
    
    var body: some View {
        TextField(title, text: $text)
            .padding()
            .frame(maxWidth: .infinity, maxHeight: 78)
            .background(.gray.opacity(0.15))
            .clipShape(RoundedRectangle(cornerRadius: 36))
            .padding(.horizontal)
    }
}

