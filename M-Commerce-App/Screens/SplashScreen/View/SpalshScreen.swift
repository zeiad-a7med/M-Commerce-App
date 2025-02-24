//
//  SpalshScreen.swift
//  M-Commerce-App
//
//  Created by Usef on 24/02/2025.
//

import SwiftUI

struct SpalshScreen: View {
    let applicationName: String = "ZeinShop"
    let applicationComercialThought: String = "Any shoppping just from home"
    let applicationVersion: String = "0.0.1"
    let applicationPowerBy: String = "Shopify"
    @State var navigateToOnBoarding : Bool = false
    var body: some View {
        NavigationView {
            ZStack {
                ThemeManager.darkPuble.ignoresSafeArea(edges: .all)
                VStack {
                    AnimationView(name: "SpalshScreenAnimation")
                        .frame(width: 250,height: 250)
                        .cornerRadius(125)
                    Text(applicationName)
                        .foregroundStyle(.white)
                        .font(.system(size: 40, weight: .bold, design: .serif))
                    Text(applicationComercialThought)
                        .foregroundStyle(.white)
                }
                VStack {
                    Spacer()
                    Text("Version \(applicationVersion)")
                        .foregroundStyle(.white)
                        .fontWeight(.light)
                    Text("Powered by \(applicationPowerBy)")
                        .foregroundStyle(.white)
                        .fontWeight(.light)
                }
                NavigationLink(
                    destination: BoardingTabView(), isActive: $navigateToOnBoarding
                ) {
                    EmptyView()
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    navigateToOnBoarding = true
                }
            }
        }
    }
}

#Preview {
    SpalshScreen()
}
