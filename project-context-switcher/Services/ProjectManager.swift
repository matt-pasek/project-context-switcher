//
//  ProjectManager.swift
//  project-context-switcher
//
//  Created by Mateusz Pasek on 27/11/2025.
//

import Foundation

@Observable class ProjectManager {
    var currentRunning: Project?
    var projects: [Project] = []
    
    init() {
        self.projects = Persistence.loadProjects()
    }
    
    func addProject(_ project: Project) {
        projects.append(project)
    }
    
    func removeProject(_ project: Project) {
        projects.removeAll(where: { $0.id == project.id })
    }
    
    func switchTo(_ project: Project) {
        currentRunning = project
        // TODO: implement full switching logic
    }
    
    func updateProjectStatus(_ project: Project, status: ProjectStatus) {
        project.status = status
    }
    
    func stopCurrentProject() {
        guard let current = currentRunning else { return }
        
        // lets pretend this is stopping logic
        updateProjectStatus(current, status: .stopping)
        // TODO: actually stop the project
        updateProjectStatus(current, status: .idle)

        currentRunning = nil
    }
}
