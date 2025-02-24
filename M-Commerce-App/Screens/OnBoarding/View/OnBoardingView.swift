//
//  OnBoardingView.swift
//  M-Commerce-App
//
//  Created by Usef on 24/02/2025.
//

import SwiftUI

struct BoardingTabView: View {
    @State var navigateToHome : Bool = false
    var body: some View {
        VStack {
            pagingSubView()
            CustomRoundedButtonView(
                text: "Register", width: 80,
                onTap: {
                    navigateToHome = true
                }, isButtonEnabled: .constant(true))
            Text("Continue as Guest")
                .foregroundStyle(ThemeManager.darkPuble)
                .bold()
                .padding()
                .onTapGesture {
                    navigateToHome = true
                }
            NavigationLink(
                destination: ContentView(), isActive: $navigateToHome
            ) {
                EmptyView()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    BoardingTabView()
}
