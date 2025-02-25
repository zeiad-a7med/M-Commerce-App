//
//  SendingVerificationView.swift
//  M-Commerce-App
//
//  Created by Zeiad on 19/02/2025.
//

import SwiftUI

struct SendingVerificationView: View {
    var email: String
    var body: some View {
        VStack {
            ContentUnavailableView(
                "Verification mail sent to \(email)",
                systemImage: "envelope.open",
                description: Text(
                    "Check your inbox 📥 then Sign In")
            ).frame(height: 300)

            CustomRoundedButtonView(
                text: "Sign In",
                width: 100,
                onTap: {
                    NavigationManager.shared.pushReplacement(.login)
                },
                isButtonEnabled: .constant(true)
            )

        }
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    SendingVerificationView(
        email: "zeiadahmed194@gmail.com"
    )
}
