//
//  WeatherViewModel.swift
//  WeatherCast
//
//  Created by Zeiad on 11/02/2025.
//

import Foundation
import SwiftData
import SwiftUI

class RegisterViewModel: ObservableObject {
    @Published var registerResponse: RegisterResponse?
    @Published var isLoading: Bool = false
    @Published var alertContent: AlertContent?

    func register(
        firstName: String,
        lastName: String,
        email: String!,
        phone: String,
        password: String!
    ) {
        isLoading = true
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
                if(result.success){
                    SnackbarManager.shared.show(message: "Successfully registered 🤝🏻!")
                }else{
                    SnackbarManager.shared.show(message: "\(result.messages.first ?? "")!")
                }
            }
            
        }
    }
}
