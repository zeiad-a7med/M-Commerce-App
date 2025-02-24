//
//  OnBoardingView.swift
//  M-Commerce-App
//
//  Created by Usef on 24/02/2025.
//

import SwiftUI

struct BoardingTabView: View {
    var body: some View {
        VStack {
            pagingSubView()
            CustomRoundedButtonView(
                text: "Create Account", width: 80,
                onTap: {
                    // nav
                    print("register!!")
                }, isButtonEnabled: .constant(true))
            Text("Already have an Account")
                .foregroundStyle(ThemeManager.darkPuble)
                .bold()
                .padding()
                .onTapGesture {
                    // nav to sign in
                    print("sign in!")
                }
        }
    }
}

#Preview {
    BoardingTabView()
}
