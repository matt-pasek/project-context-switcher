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
    
    var javaVersion: String?
}
