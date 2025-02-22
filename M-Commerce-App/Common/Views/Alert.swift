//
//  SnakeBar.swift
//  M-Commerce-App
//
//  Created by Zeiad on 15/02/2025.
//

import Foundation
import SwiftUI

struct AlertView: View {
    @EnvironmentObject var alertManager: AlertManager
    @State private var shouldNavigateToLogin = false
    var body: some View {
        VStack {
            // Navigation link outside the alert to handle navigation properly
            NavigationLink(
                destination: LoginView(), isActive: $shouldNavigateToLogin
            ) {
                EmptyView()
            }
        }
        .frame(maxWidth: .infinity)
        .zIndex(2)
        .alert(
            alertManager.title,
            isPresented: Binding(
                get: { alertManager.isVisible },
                set: { alertManager.isVisible = $0 }
            )
        ) {

            Button("Sign In") {
                shouldNavigateToLogin = true
                
            }

            Button("Cancel") {}

        } message: {
            Text(alertManager.message)
        }
    }
}
