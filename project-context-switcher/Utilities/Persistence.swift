//
//  Persistence.swift
//  project-context-switcher
//
//  Created by Mateusz Pasek on 27/11/2025.
//

import Foundation

enum Persistence {
    private static let projectsKey = "projects"
    
    static func saveProjects(_ projects: [Project]) {
        let encoder = JSONEncoder()
        
        if let encoded = try? encoder.encode(projects) {
            UserDefaults.standard.set(encoded, forKey: projectsKey)
        }
    }
    
    static func loadProjects() -> [Project] {
        let decoder = JSONDecoder()
        
        if let data = UserDefaults.standard.data(forKey: projectsKey), let projects = try? decoder.decode([Project].self, from: data) {
            return projects
        }
        
        return []
    }
}
