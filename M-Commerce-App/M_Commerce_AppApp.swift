//
//  M_Commerce_AppApp.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 12/02/2025.
//
//
//  M_Commerce_AppApp.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 12/02/2025.
//
//
//  M_Commerce_AppApp.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 12/02/2025.
//

import SwiftData
import SwiftUI

@main
struct M_Commerce_AppApp: App {
    var body: some Scene {
        WindowGroup {
            let isSimulator = TARGET_OS_SIMULATOR != 0
            let sharedModelContainer: ModelContainer? = isSimulator ? {
                let schema = Schema([Product.self])
                let modelConfiguration = ModelConfiguration(
                    schema: schema, isStoredInMemoryOnly: false)

                do {
                    return try ModelContainer(
                        for: schema, configurations: [modelConfiguration])
                } catch {
                    fatalError("Could not create ModelContainer: \(error)")
                }
            }() : nil
            
            ZStack {
                ContentView()
                SnackbarView()
                    .environmentObject(SnackbarManager.shared)
            }
            .applyModelContainer(sharedModelContainer)
        }
    }
}

// Extension to conditionally apply modelContainer
extension View {
    @ViewBuilder
    func applyModelContainer(_ container: ModelContainer?) -> some View {
        if let container = container {
            self.modelContainer(container)
        } else {
            self
        }
    }
}
