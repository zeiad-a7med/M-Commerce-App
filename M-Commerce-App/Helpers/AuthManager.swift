//
//  FavoritesManager.swift
//  M-Commerce-App
//
//  Created by Zeiad on 15/02/2025.
//

import Foundation
import SwiftData

class AuthManager: ObservableObject {
    static let shared = AuthManager()  // Singleton instance
    @Published var applicationUser: ApplicationUser?
    private var modelContext: ModelContext?

    private init() {}  // Private initializer to enforce singleton pattern

    /// Set the modelContext from outside (since we can't inject `@Environment` in a singleton)
    func setContext(_ context: ModelContext) {
        self.modelContext = context
        loadApplicationUser()  // Load user when context is set
    }

    /// Fetch or create the application user
    func loadApplicationUser() {
        guard let modelContext = modelContext else { return }
        do {
            let request = FetchDescriptor<ApplicationUser>()
            if let user = try modelContext.fetch(request).first {
                DispatchQueue.main.async {
                    self.applicationUser = user
                }
            }
        } catch {
            print("Error fetching application user: \(error)")
        }
    }

    /// Update user details (name, email, etc.)
    func updateUser(updatedUser: ApplicationUser) {
        guard let modelContext = modelContext else { return }

        if applicationUser != nil {
            logoutUser()
        }
        modelContext.insert(updatedUser)
        applicationUser = updatedUser

        do {
            try modelContext.save()
            loadApplicationUser()  // Refresh after saving
        } catch {
            print("Error saving user: \(error)")
        }
    }

    /// Logout: Remove the user and reset the session
    func logoutUser() {
        guard let modelContext = modelContext, let user = applicationUser else {
            print("Logout failed: No user found.")
            return
        }
        do {
            modelContext.delete(user)
            try modelContext.save()
            DispatchQueue.main.async {
                self.applicationUser = nil
            }
        } catch {
            print("Error logging out user: \(error)")
        }
    }
    
    func isLoggedIn() -> Bool {
        return applicationUser != nil && !(applicationUser!.accessToken!.isEmpty)
    }

}
