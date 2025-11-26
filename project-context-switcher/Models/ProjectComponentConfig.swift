//
//  ProjectComponentConfig.swift
//  project-context-switcher
//
//  Created by Mateusz Pasek on 26/11/2025.
//

import Foundation

protocol ProjectComponentConfig: Codable, Identifiable {
    var id: UUID { get set }
    var label: String { get set }
    var path: String { get set }
    var ideApp: String? { get set }
    var devCommand: String { get set }
    var autoInstallDeps: Bool { get set }
    var autoFetchChanges: Bool { get set }
}
