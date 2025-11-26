//
//  Project.swift
//  project-context-switcher
//
//  Created by Mateusz Pasek on 26/11/2025.
//

import Foundation
import SwiftUI

enum ProjectStatus: Equatable {
    case idle
    case starting
    case running
    case stopping
    case error(message: String)
}

@Observable class Project: Identifiable {
    var id = UUID()
    var name: String
    var frontendConfig: [FrontendConfig] = []
    var backendConfig: [BackendConfig] = []
    var dockerConfig: DockerConfig?
    var links: [String] = []
    var status: ProjectStatus = .idle
    
    init(name: String) {
        self.name = name
    }
}

extension Project {
    static var mockOrange: Project {
        let project = Project(name: "Orange")
        project.status = .running
        project.frontendConfig = [
            FrontendConfig(label: "Web", path: "/projects/orange-web", devCommand: "dev", autoInstallDeps: true, autoFetchChanges: true, useNvm: true, devPort: 2137)
        ]
        return project
    }
    
    static var mockJeronimo: Project {
        let project = Project(name: "Jeronimo")
        project.status = .idle
        return project
    }
}
