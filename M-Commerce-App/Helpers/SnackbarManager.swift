//
//  SnackbarManager.swift
//  M-Commerce-App
//
//  Created by Zeiad on 15/02/2025.
//

import Foundation
import SwiftUI

class SnackbarManager: ObservableObject {
    static let shared = SnackbarManager()
    
    @Published var message: String = ""
    @Published var isVisible: Bool = false

    func show(message: String, duration: Double = 3.0) {
        self.message = message
        self.isVisible = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            withAnimation {
                self.isVisible = false
            }
        }
    }
}
