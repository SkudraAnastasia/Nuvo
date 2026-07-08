//
//  Constants.swift
//  Nuvo
//
//  Created by Anastasia on 15.06.2026.
//
enum AppTab: CaseIterable {
    case home
    case statistic
    case settings
    
    var title: String {
        switch self {
        case .home: "Home"
        case .statistic: "Statistics"
        case .settings: "Settings"
        }
    }
    
    var icon: String {
        switch self {
        case .home: "house"
        case .statistic: "chart.bar"
        case .settings: "gearshape"
        }
    }
}


