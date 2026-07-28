//
//  TabBarView.swift
//  Nuvo
//
//  Created by Anastasia on 15.06.2026.
//

import SwiftUI

struct TabBarView: View {
    @State private var selectedTab: AppTab = .home
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(AppTab.allCases, id: \.self) { tab in
                Tab(tab.title, systemImage: tab.icon, value: tab) {
                    switch tab {
                    case .home:
                        NavigationStack {
                            WordGroupsView()
                                .tint(.primary)
                        }
                    case .statistic: StatisticView()
                            .tint(.primary)
                    case .settings: SettingsView()
                            .tint(.primary)
                    }
                }
            }
        }
        .tint(.orange)
    }
}

#Preview {
    TabBarView()
}
