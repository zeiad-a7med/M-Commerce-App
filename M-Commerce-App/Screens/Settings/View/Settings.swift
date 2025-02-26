//
//  SwiftUIView.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 14/02/2025.
//

import SwiftUI

struct Settings: View {
    @StateObject var viewModel = SettingsViewModel()
    @State var currentCurrency: String = "USD"
    @State var oldPassword: String = "2424"
    @State var newPassword: String = " "
    @State var confirmNewPassword: String = " "
    @State var isLoggedIn: Bool = false
    @State var isAlertVisible: Bool = false
    var body: some View {
        VStack {
            if isLoggedIn {

                List {
                    Section(
                        header: Text("General").foregroundStyle(
                            ThemeManager.darkPuble
                        ).font(.headline)
                    ) {

                        Button(
                            action: {
                                NavigationManager.shared.push(.editProfile)
                            },
                            label: {
                                SettingsListRow(
                                    imageName: "person", RowName: "Edit Profile"
                                )
                            }
                        ).foregroundStyle(.primary)

                    }
                    Section(
                        header: Text("Prefrences").foregroundStyle(
                            ThemeManager.darkPuble
                        ).font(.headline)
                    ) {
                        Currency()

                        Button(
                            action: {
                                NavigationManager.shared.push(.addresses)
                            },
                            label: {
                                SettingsListRow(
                                    imageName:
                                        "location",
                                    RowName: "Addresses"
                                )
                            }
                        ).foregroundStyle(.primary)

                        Button(
                            action: {
                                isAlertVisible.toggle()
                            },
                            label: {
                                SettingsListRow(
                                    imageName:
                                        "rectangle.portrait.and.arrow.forward",
                                    RowName: "Logout", imageColor: .red
                                ).foregroundStyle(.red)
                            }

                        )
                    }

                }.listRowSpacing(15)
                    .alert(
                        "are you sure you want to logout",
                        isPresented: $isAlertVisible
                    ) {
                        Button(
                            role: .destructive,
                            action: {
                                viewModel.logout()
                            },
                            label: {
                                Text("Logout")
                                    .foregroundStyle(.red)
                                    .bold()
                            }
                        ).disabled(viewModel.isLoading)

                    } message: {
                        Text(
                            "once you logout you will lose all your favorites"
                        )
                    }.overlay {
                        if(viewModel.isLoading){
                            VStack {
                                CustomProgressView()
                            }.frame(
                                width: UIScreen.main.bounds.width,
                                height: UIScreen.main.bounds.height
                            )
                            .background(.primary.opacity(0.1))
                        }
                    }
            } else {
                RequireLoginView()
            }
        }
        .onAppear {
            isLoggedIn = AuthManager.shared.isLoggedIn()
        }
        .navigationTitle("Settings")
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Settings()
}
