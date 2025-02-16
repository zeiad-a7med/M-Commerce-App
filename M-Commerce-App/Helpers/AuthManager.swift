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
    func updateUser(name: String? = nil, email: String? = nil) {
        guard let modelContext = modelContext, let user = applicationUser else {
            return
        }
//        if let name = name { user.name = name }
        if let email = email { user.email = email }
        saveContext()
    }

    /// Logout: Remove the user and reset the session
    func logoutUser() {
        guard let modelContext = modelContext, let user = applicationUser else {
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

    /// Save changes to the database
    private func saveContext() {
        guard let modelContext = modelContext else { return }
        do {
            try modelContext.save()
            DispatchQueue.main.async {
                self.objectWillChange.send()  // Notify views to update
            }
        } catch {
            print("Error saving application user: \(error)")
        }
    }
}
