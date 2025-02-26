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
    var body: some View {
        VStack {
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
                NavigationManager.shared.push(.login)
            }

            Button("Cancel") {}

        } message: {
            Text(alertManager.message)
        }
    }
}
