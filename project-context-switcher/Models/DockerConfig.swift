//
//  DockerConfig.swift
//  project-context-switcher
//
//  Created by Mateusz Pasek on 26/11/2025.
//

struct DockerConfig: Codable {
    var path: String
    var containerNames: [String]
    var autoStart: Bool
}
