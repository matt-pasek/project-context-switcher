//
//  ContentView.swift
//  project-context-switcher
//
//  Created by Mateusz Pasek on 26/11/2025.
//

import SwiftUI

let mockProjects: [Project] = [
    Project.mockJeronimo, Project.mockOrange
]

struct MenuBarView: View {
    var body: some View {
        VStack {
            Text("Running")
            ForEach(mockProjects, id: \.id) { project in
                if project.status == .running {
                    Menu("\(project.name) - running") {
                        ForEach(project.frontendConfig, id: \.id) { fe in
                            Text("\(fe.label) - port \(String(fe.devPort))")
                        }
                        ForEach(project.backendConfig, id: \.id) { be in
                            Text("\(be.label) - port \(be.devPort)")
                        }
                    
                        Divider()
                        
                        if let dockerConfig = project.dockerConfig {
                            Text("Docker Containers")
                            ForEach(dockerConfig.containerNames, id: \.self) { container in
                                Text("\(container) - *status*")
                            }
                        }
                            
                        Divider()
                        Button("Stop", systemImage: "xmark.circle", action: {print("Stop project")})
                        Divider()
                        Button("Open in Finder", action: { print("Open in Finder") })
                        Button("View Logs", action: { print("View Logs") })
                    }
                }
            }
            Divider()
            Text("Available projects")
            ForEach(mockProjects, id: \.id) { project in
                Text(project.name)
            }
            Divider()
            Button(action: { print("Open preferences")}) {
                Label("Preferences", systemImage: "gear")
            }
            Button(action: { print("Quit app") }) {
                Label("Quit", systemImage: "x.square")
            }
        }
    }
}

#Preview {
    MenuBarView()
}
