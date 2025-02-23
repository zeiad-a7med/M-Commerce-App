//
//  RequireLoginView.swift
//  M-Commerce-App
//
//  Created by Zeiad on 24/02/2025.
//

import SwiftUI

struct RequireLoginView: View {
    var body: some View {
        VStack {
            ContentUnavailableView(
                "You are not signed in",
                systemImage: "person.slash",
                description: Text(
                    "Sign in now to access more features")
            ).frame(height: 300)

            CustomRoundedButtonView(
                text: "Sign In",
                width: 100,
                onTap: {
                    NavigationManager.shared.push(.login)
                },
                isButtonEnabled: .constant(true)
            )

        }

    }
}

#Preview {
    RequireLoginView()
}
