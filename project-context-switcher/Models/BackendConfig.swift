//
//  BackendConfig.swift
//  project-context-switcher
//
//  Created by Mateusz Pasek on 26/11/2025.
//

import Foundation

struct BackendConfig: ProjectComponentConfig {
    var id: UUID
    var label: String
    var path: String
    var ideApp: String?
    var devCommand: String
    var autoInstallDeps: Bool
    var autoFetchChanges: Bool
    var devPort: Int
    
    var javaVersion: String?
    
    init(label: String, path: String, ideApp: String? = nil, devCommand: String, autoInstallDeps: Bool, autoFetchChanges: Bool, javaVersion: String? = nil, devPort: Int) {
        self.id = UUID()
        self.label = label
        self.path = path
        self.ideApp = ideApp
        self.devCommand = devCommand
        self.autoInstallDeps = autoInstallDeps
        self.autoFetchChanges = autoFetchChanges
        self.javaVersion = javaVersion
        self.devPort = devPort
    }
}
