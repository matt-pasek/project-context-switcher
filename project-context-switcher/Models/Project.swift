//
//  Project.swift
//  project-context-switcher
//
//  Created by Mateusz Pasek on 26/11/2025.
//

import Foundation
import SwiftUI

@Observable class Project: Identifiable {
    var id = UUID()
    var name: String
    var frontendConfig: [FrontendConfig] = []
    var backendConfig: [BackendConfig] = []
    var dockerConfig: DockerConfig?
    var links: [String] = []
    
    init(name: String) {
        self.name = name
    }
}
