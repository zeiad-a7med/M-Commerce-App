//
//  SpalshScreen.swift
//  M-Commerce-App
//
//  Created by Usef on 24/02/2025.
//

import SwiftData
import SwiftUI

struct SpalshScreen: View {
    @Query private var newComers: [NewComer]
    @Environment(\.modelContext) private var modelContext
    let applicationName: String = "Shopio"
    let applicationComercialThought: String = "Where Shopping Meets Simplicity"
    let applicationVersion: String = "0.0.1"
    let applicationPowerBy: String = "Shopify"
    @State var navigateToOnBoarding: Bool = false
    @State var navigateToHome: Bool = false
    var body: some View {
        NavigationView {
            ZStack {
                ThemeManager.darkPuble.ignoresSafeArea(edges: .all)
                VStack {
                    Image(.logoWithBackground)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 230, height: 230)
                        .background{
                            Circle().fill(.white).frame(width: 330, height: 330)
                        }
                        .padding(.bottom,80)
                        
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
                    HStack{
                        Text("Powered by")
                            .foregroundStyle(.white)
                            .fontWeight(.light)
                        Image(.shopify)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 80)
                    }
                }
                NavigationLink(
                    destination: BoardingTabView(),
                    isActive: $navigateToOnBoarding
                ) {
                    EmptyView()
                }
                NavigationLink(
                    destination: ContentView(), isActive: $navigateToHome
                ) {
                    EmptyView()
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    if !AuthManager.shared.isLoggedIn() {
                        navigateToOnBoarding = true
                    } else {
                        navigateToHome = true
                    }
                }
            }
        }
    }
}

#Preview {
    SpalshScreen()
}
