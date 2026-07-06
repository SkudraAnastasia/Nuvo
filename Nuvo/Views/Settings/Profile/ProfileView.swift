//
//  ProfileView.swift
//  Nuvo
//
//  Created by Anastasia on 18.06.2026.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        Image(systemName: "person.fill")
            .resizable()
            .frame(width: 300, height: 300)
            .foregroundStyle(.blue)
    }
}

#Preview {
    ProfileView()
}
