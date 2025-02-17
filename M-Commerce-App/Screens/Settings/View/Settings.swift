//
//  SwiftUIView.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 14/02/2025.
//

import SwiftUI

struct Settings: View {
    @State var currentCurrency: String = "USD"
    @State var oldPassword: String = "2424"
    @State var newPassword: String = " "
    @State var confirmNewPassword: String = " "
    @State var isLoggedIn: Bool = false
    @State var isAlertVisible: Bool = false
    var body: some View {

        NavigationView {

            VStack {
                if isLoggedIn {
                    List {
                        Section(
                            header: Text("General").foregroundStyle(
                                ThemeManager.darkPuble
                            ).font(.headline)
                        ) {
                            NavigationLink {
                                EditProfile()
                            } label: {
                                SettingsListRow(
                                    imageName: "person", RowName: "Edit Profile"
                                )
                            }
                            NavigationLink {
                                ChangePassword(
                                    oldPassword: $oldPassword,
                                    newPassword: $newPassword,
                                    confirmPassword: $confirmNewPassword)
                            } label: {
                                SettingsListRow(
                                    imageName: "lock",
                                    RowName: "Change Password")
                            }

                        }
                        Section(
                            header: Text("Prefrences").foregroundStyle(
                                ThemeManager.darkPuble
                            ).font(.headline)
                        ) {
                            Currency()

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
                                    AuthManager.shared.logoutUser()
                                },
                                label: {
                                    Text("Logout")
                                        .foregroundStyle(.red)
                                        .bold()

                                })

                        } message: {
                            Text(
                                "once you logout you will lose all your favorites"
                            )
                        }
                } else {
                    VStack {
                        ContentUnavailableView(
                            "You are not logged in",
                            systemImage: "person.slash",
                            description: Text(
                                "to view your favorites please sign in")
                        ).frame(height: 300)
                        NavigationLink(destination: LoginView()) {
                            CustomRoundedButtonView(
                                text: "Sign In",
                                width: 100,
                                onTap: {},
                                isButtonEnabled: .constant(true)
                            )
                            .allowsHitTesting(false)
                        }
                    }
                }
            }
            .onAppear {
                isLoggedIn = AuthManager.shared.isLoggedIn()
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    Settings()
}
