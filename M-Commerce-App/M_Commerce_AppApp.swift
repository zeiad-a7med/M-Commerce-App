//
//  M_Commerce_AppApp.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 12/02/2025.
//

import Firebase
import SwiftData
import SwiftUI

@main
struct M_Commerce_AppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @State private var networkMonitor = NetworkMonitor()
    var body: some Scene {
        WindowGroup {
            let sharedModelContainer: ModelContainer? = {
                let schema = Schema([
                    Product.self, ApplicationUser.self, CurrencyRate.self, NewComer.self
                ])
                let modelConfiguration = ModelConfiguration(
                    schema: schema, isStoredInMemoryOnly: false)

                do {
                    return try ModelContainer(
                        for: schema, configurations: [modelConfiguration])
                } catch {
                    fatalError("Could not create ModelContainer: \(error)")
                }
            }()
            ZStack {
                SpalshScreen()
                    .environment(networkMonitor)
                SnackbarView()
                    .environmentObject(SnackbarManager.shared)
                AlertView()
                    .environmentObject(AlertManager.shared)
            }
            .applyModelContainer(sharedModelContainer)
        }
    }
}
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication
            .LaunchOptionsKey: Any]?
    ) -> Bool {
        FirebaseApp.configure()
        print("configured")
        return true
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
