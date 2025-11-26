//
//  FrontendConfig.swift
//  project-context-switcher
//
//  Created by Mateusz Pasek on 26/11/2025.
//

import Foundation

struct FrontendConfig: ProjectComponentConfig {
    var id: UUID
    var label: String
    var path: String
    var ideApp: String?
    var devCommand: String
    var autoInstallDeps: Bool
    var autoFetchChanges: Bool
    var devPort: Int
    
    var useNvm: Bool
    var nodeVersion: String?
    
    init(label: String, path: String, ideApp: String? = nil, devCommand: String, autoInstallDeps: Bool, autoFetchChanges: Bool, useNvm: Bool, nodeVersion: String? = nil, devPort: Int) {
        self.id = UUID()
        self.label = label
        self.path = path
        self.ideApp = ideApp
        self.devCommand = devCommand
        self.autoInstallDeps = autoInstallDeps
        self.autoFetchChanges = autoFetchChanges
        self.useNvm = useNvm
        self.nodeVersion = nodeVersion
        self.devPort = devPort
    }
}
