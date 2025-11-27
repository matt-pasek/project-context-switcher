//
//  Project.swift
//  project-context-switcher
//
//  Created by Mateusz Pasek on 26/11/2025.
//

import Foundation
import SwiftUI

enum ProjectStatus: Equatable, Codable {
    case idle
    case starting
    case running
    case stopping
    case error(message: String)
}

@Observable class Project: Identifiable, Codable {
    var id = UUID()
    var name: String
    var frontendConfig: [FrontendConfig] = []
    var backendConfig: [BackendConfig] = []
    var dockerConfig: DockerConfig?
    var links: [String] = []
    var status: ProjectStatus = .idle
    
    enum CodingKeys: String, CodingKey {
        case id, name, frontendConfig, backendConfig, dockerConfig, links, status
    }
    
    init(name: String) {
        self.name = name
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(UUID.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        frontendConfig = try container.decode([FrontendConfig].self, forKey: .frontendConfig)
        backendConfig = try container.decode([BackendConfig].self, forKey: .backendConfig)
        dockerConfig = try container.decodeIfPresent(DockerConfig.self, forKey: .dockerConfig)
        links = try container.decode([String].self, forKey: .links)
        status = try container.decode(ProjectStatus.self, forKey: .status)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(frontendConfig, forKey: .frontendConfig)
        try container.encode(backendConfig, forKey: .backendConfig)
        try container.encodeIfPresent(dockerConfig, forKey: .dockerConfig)
        try container.encode(links, forKey: .links)
        try container.encode(status, forKey: .status)
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
