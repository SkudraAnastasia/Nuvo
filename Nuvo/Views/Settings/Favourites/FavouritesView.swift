//
//  FavouritesView.swift
//  Nuvo
//
//  Created by Anastasia on 18.06.2026.
//

import SwiftUI

struct FavouritesView: View {
    var body: some View {
        Image(systemName: "star.fill")
            .resizable()
            .frame(width: 300, height: 300)
            .foregroundStyle(.yellow)
    }
}

#Preview {
    FavouritesView()
}
