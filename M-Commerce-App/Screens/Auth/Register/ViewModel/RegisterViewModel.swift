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

class RegisterViewModel: ObservableObject {
    @Published var registerResponse: RegisterResponse?
    @Published var isLoading: Bool = false
    @Published var successRegister: Bool = false
    @Published var alertContent: AlertContent?

    func register(
        firstName: String,
        lastName: String,
        email: String!,
        phone: String,
        password: String!
    ) {
        isLoading = true
        Auth.auth().createUser(withEmail: email, password: password) {
            authResult, error in
            if let error = error as? NSError {
                if error.code == AuthErrorCode.emailAlreadyInUse.rawValue {
                    SnackbarManager.shared.show(
                        message:
                            "The email is allready in use\nPlease try again with another email"
                    )
                } else {
                    SnackbarManager.shared.show(
                        message:
                            "Failed to register\nPlease try again later!"
                    )
                }

            } else if let user = authResult?.user {
                user.sendEmailVerification { verficationError in
                    if let error = verficationError {
                        user.delete()
                        SnackbarManager.shared.show(
                            message:
                                "Failed to send verification email\nPlease try again later"
                        )
                        
                    } else {
                        print("verification email sent")
                        AuthService.registerCustomer(
                            firstName: firstName,
                            lastName: lastName,
                            email: email,
                            phone: phone,
                            password: password,
                            acceptsMarketing: true
                        ) { (result) in
                            DispatchQueue.main.async {
                                self.isLoading = false
                                self.registerResponse = result
                                if result.success {
                                    self.successRegister = true
                                } else {
                                    SnackbarManager.shared.show(
                                        message:
                                            "\(result.messages.first ?? "")!")
                                    user.delete()
                                }
                            }

                        }
                    }
                }

            }
        }

    }
}
