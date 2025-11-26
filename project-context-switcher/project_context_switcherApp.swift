//
//  project_context_switcherApp.swift
//  project-context-switcher
//
//  Created by Mateusz Pasek on 26/11/2025.
//

import SwiftUI

@main
struct project_context_switcherApp: App {
    var body: some Scene {
        MenuBarExtra {
            ContentView()
        } label: {
            Image(systemName: "folder.badge.gearshape")
        }
        .menuBarExtraStyle(.menu)
    }
}
