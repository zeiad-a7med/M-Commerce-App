//
//  OnBoardingView.swift
//  M-Commerce-App
//
//  Created by Usef on 24/02/2025.
//

import SwiftUI

struct BoardingTabView: View {
    @State var navigateToHome : Bool = false
    @State var navigateToLogin : Bool = false
    var body: some View {
        VStack {
            pagingSubView()
            CustomRoundedButtonView(
                text: "Sign In", width: 80,
                onTap: {
                    navigateToHome = true
                    navigateToLogin = true
                }, isButtonEnabled: .constant(true))
            Text("Continue as Guest")
                .foregroundStyle(ThemeManager.darkPuble)
                .bold()
                .padding()
                .onTapGesture {
                    navigateToHome = true
                }
            NavigationLink(
                destination: ContentView(navigateToLogin:navigateToLogin), isActive: $navigateToHome
            ) {
                EmptyView()
            }
        }
        .navigationBarHidden(true) // Hide the navigation bar for this view

    }
}

#Preview {
    BoardingTabView()
}
