//
//  AlertManager.swift
//  M-Commerce-App
//
//  Created by Zeiad on 15/02/2025.
//

import Foundation
import SwiftUI

class AlertManager: ObservableObject {
    static let shared = AlertManager()
    
    @Published var title: String = ""
    @Published var message: String = ""
    @Published var isVisible: Bool = false

    func showLoginAlert() {
        self.title = "You are not Signed In"
        self.message = "Sign in now to access more features"
        self.isVisible = true
    }
}
