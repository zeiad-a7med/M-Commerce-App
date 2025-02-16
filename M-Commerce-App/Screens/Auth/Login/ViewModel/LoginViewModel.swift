//
//  WeatherViewModel.swift
//  WeatherCast
//
//  Created by Zeiad on 11/02/2025.
//

import Foundation
import SwiftData
import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var loginResponse: LoginResponse?
    @Published var isLoading: Bool = false
    @Published var alertContent: AlertContent?

    func login(
        email: String!,
        password: String!
    ) {
        isLoading = true
        LoginService.registerCustomer(
            email: email,
            password: password
        ) { (result) in
            DispatchQueue.main.async {
                self.isLoading = false
                self.loginResponse = result
                if(result.success){
                    SnackbarManager.shared.show(message: "Signed in successfully 🤝🏻!")
                    print(result.accessToken ?? "")
                }else{
                    SnackbarManager.shared.show(message: "\(result.messages.first ?? "")!")
                }
            }
            
        }
    }
}
