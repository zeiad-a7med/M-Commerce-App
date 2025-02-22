//
//  M_Commerce_AppApp.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 12/02/2025.
//

import SwiftData
import SwiftUI
import Firebase

@main
struct M_Commerce_AppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            let isSimulator = TARGET_OS_SIMULATOR != 0
            let sharedModelContainer: ModelContainer? = isSimulator ? {
                let schema = Schema([Product.self,ApplicationUser.self,CurrencyRate.self])
                let modelConfiguration = ModelConfiguration(
                    schema: schema, isStoredInMemoryOnly: false)

                do {
                    return try ModelContainer(
                        for: schema, configurations: [modelConfiguration])
                } catch {
                    fatalError("Could not create ModelContainer: \(error)")
                }
            }() : nil
            
            NavigationView{
                ZStack {
                    ContentView()
                    SnackbarView()
                        .environmentObject(SnackbarManager.shared)
                    AlertView()
                        .environmentObject(AlertManager.shared)
                }
                .applyModelContainer(sharedModelContainer)
            }
        }
    }
}
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
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
