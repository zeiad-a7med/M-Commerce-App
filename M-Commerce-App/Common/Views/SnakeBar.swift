//
//  SnakeBar.swift
//  M-Commerce-App
//
//  Created by Zeiad on 15/02/2025.
//

import Foundation
import SwiftUI

import SwiftUI

struct SnackbarView: View {
    @EnvironmentObject var snackbarManager: SnackbarManager

    var body: some View {
        VStack {
            Spacer()
            if snackbarManager.isVisible {
                Text(snackbarManager.message)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black.opacity(0.8))
                    .cornerRadius(10)
                    .padding(.bottom, 20)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
            }
        }
        .frame(maxWidth: .infinity)
        .animation(.easeInOut, value: snackbarManager.isVisible)
        .zIndex(1)
    }
}

