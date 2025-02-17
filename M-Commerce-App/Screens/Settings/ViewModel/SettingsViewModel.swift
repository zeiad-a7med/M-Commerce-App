//
//  SettingsViewModel.swift
//  M-Commerce-App
//
//  Created by Zeiad on 17/02/2025.
//

import Foundation
import SwiftData
import SwiftUI

class SettingsViewModel: ObservableObject {
    @Published var updateProfileResponse: UpdateProfileResponse?
    @Published var user: ApplicationUser?
    @Published var isLoading: Bool = false
    @Published var alertContent: AlertContent?

    init(){
        user = AuthManager.shared.applicationUser
    }
    
    func updateProfile(
        firstName: String,
        lastName: String,
        email: String,
        phone: String,
        password: String? = nil,
        acceptsMarketing: Bool? = nil
    ) {
        isLoading = true
        if(AuthManager.shared.isLoggedIn()){
            AuthService.updateProfile(
                customerAccessToken: user!.accessToken!,
                accessTokenExpiresAt: user!.accessTokenExpiresAt!,
                firstName: firstName,
                lastName: lastName,
                email: email,
                phone: phone,
                password: password,
                acceptsMarketing: acceptsMarketing
            ) { (result) in

                DispatchQueue.main.async {
                    self.isLoading = false
                    self.updateProfileResponse = result
                    if result.success {
                        SnackbarManager.shared.show(
                            message: "Profile updated successfully 🤝🏻!")
                        print(result.applicationUser?.lastName ?? "")
                        AuthManager.shared.updateUser(updatedUser: result.applicationUser!)
                    } else {
                        SnackbarManager.shared.show(
                            message: "\(result.messages.first ?? "")!")
                    }
                }
            }
        }
    }
}
