//
//  WeatherViewModel.swift
//  WeatherCast
//
//  Created by Zeiad on 11/02/2025.
//

import FirebaseAuth
import Foundation
import SwiftData
import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var loginResponse: LoginResponse?
    @Published var isLoading: Bool = false
    @Published var resendVerficationMailVisible: Bool = false
    @Published var alertContent: AlertContent?

    func login(
        email: String!,
        password: String!
    ) {
        isLoading = true

        Auth.auth().signIn(withEmail: email, password: password) {
            authResult, error in
            if let error = error {
                self.isLoading = false
                SnackbarManager.shared.show(
                    message:
                        "The email or password is incorrect, please try again!"
                )
            } else if let user = authResult?.user {
                user.reload { reloadError in  // Refresh user info
                    if let reloadError = reloadError {
                        SnackbarManager.shared.show(
                            message:
                                "Some thing went wrong, please try again later!"
                        )
                        self.isLoading = false
                    } else {
                        if user.isEmailVerified {

                            self.LoginWithShopify(
                                email: email, password: password)

                        } else {
                            SnackbarManager.shared.show(
                                message:
                                    "Email is not verified yet!\nCheck your inbox 📥 to verify"
                            )
                            self.resendVerficationMailVisible = true
                            self.isLoading = false
                        }
                    }
                }
            }
        }

    }

    func LoginWithShopify(
        email: String!,
        password: String!
    ) {
        AuthService.loginCustomer(
            email: email,
            password: password
        ) { (result) in

            DispatchQueue.main.async {
                self.isLoading = false
                self.loginResponse = result
                if result.success {
                    SnackbarManager.shared.show(
                        message: "Signed in successfully 🤝🏻!")
                    AuthManager.shared.updateUser(
                        updatedUser: result.applicationUser!)
                    NavigationManager.shared.pop()
                } else {
                    SnackbarManager.shared.show(
                        message: "\(result.messages.first ?? "")!")
                }
            }
        }
    }
    
    func resendEmailVerification() {
        isLoading = true
        if let user = Auth.auth().currentUser, !user.isEmailVerified {
            user.sendEmailVerification { error in
                self.isLoading = false
                if let error = error {
                    SnackbarManager.shared.show(
                        message: "Failed To send verification mail!")
                } else {
                    
                    SnackbarManager.shared.show(
                        message: "Verification email sent successfully!")
                    NavigationManager.shared.pushReplacement(.sendingVerification(email: user.email ?? ""))
                }
            }
        }
    }

}
