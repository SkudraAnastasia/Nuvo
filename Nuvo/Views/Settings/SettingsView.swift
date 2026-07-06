//
//  SettingsView.swift
//  Nuvo
//
//  Created by Anastasia on 15.06.2026.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    @AppStorage("selectedLAnguage") private var selectedLAnguage = "ru"
    
    @State private var showDeleteConfirmation = false
    
    var body: some View {
        
        NavigationStack {
            List {
                Section {
                    NavigationLink(destination: ProfileView()) {
                        HStack(spacing: 15) {
                            Image(systemName: "person.fill")
                                .foregroundStyle(.blue)
                            Text("My profile")
                        }
                    }
                }
                
                Section {
                    NavigationLink(destination: FavouritesView()) {
                        HStack(spacing: 15) {
                            Image(systemName: "star.fill")
                                .foregroundStyle(.yellow)
                            Text("Favourites")
                        }
                    }
                }
                
                Section {
                    Toggle(isOn: $isDarkMode) {
                        Label("Dark theme", systemImage: "moon.fill")
                    }
                        
                    Picker("Language", systemImage: "globe", selection: $selectedLAnguage) {
                        Text("Русский").tag("ru")
                        Text("English").tag("en")
                        Text("Espanol").tag("es")
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section {
                    Button(role: .destructive) {
                        showDeleteConfirmation = true
                    } label: {
                        Label("Delete all", systemImage: "trash")
                            .foregroundStyle(.red)
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
