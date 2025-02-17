//
//  EditProfile.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 14/02/2025.
//

import SwiftUI

struct EditProfile: View {
    @State var profilePic: String =
        "https://static.wikia.nocookie.net/dreamworks/images/3/3e/Tai_Lung_Profile.jpg/revision/latest?cb=20240210212257"
    @StateObject var viewModel = SettingsViewModel()
    @State private var selectedCountry: Country = Constants.countries.first!

    @State var firstName: String = ""
    @State private var firstNameValid: Bool = false

    @State var lastName: String = ""
    @State private var lastNameValid: Bool = false

    @State var email: String = ""
    @State private var emailValid: Bool = false

    @State var phone: String = ""
    @State private var phoneValid: Bool = false

    @State private var showingAlert: Bool = false
    @State private var isFormValid = false
    @State private var sureToUpdate = false
    var body: some View {
        VStack {
            ProfileImage(profilePic: profilePic)

            VStack(alignment: .leading) {
                Text("First name")
                    .font(.title2)
                CustomTextField(
                    placeholder: "First name",
                    onChange: { val in
                        firstName = val
                    },
                    prefix: {
                        Image(systemName: "person.fill")
                    },
                    validationType: .text,
                    isValid: { valid in
                        firstNameValid = valid
                    },
                    initialText: $firstName

                )

                Text("Last name")
                    .font(.title2)

                CustomTextField(
                    placeholder: "Last name",
                    onChange: { val in
                        lastName = val
                    },
                    prefix: {
                        Image(systemName: "person.fill")
                    },
                    validationType: .text,
                    isValid: { valid in
                        lastNameValid = valid
                    },
                    initialText: $lastName

                )

                Text("Email")
                    .font(.title2)

                CustomTextField(
                    placeholder: "Email",
                    onChange: { val in
                        email = val
                    },
                    prefix: {
                        Image(systemName: "envelope.fill")
                    },
                    validationType: .email,
                    isValid: { valid in
                        emailValid = valid
                    },
                    initialText: $email

                )

                Text("phone")
                    .font(.title2)
                CustomTextField(
                    placeholder: "Enter your phone number",
                    onChange: { val in
                        phone = val
                    },
                    prefix: {
                        Picker(
                            "Select Country",
                            selection: $selectedCountry
                        ) {
                            ForEach(Constants.countries, id: \.self) {
                                country in
                                Text(
                                    "\(country.flag) \(country.name) (\(country.code))"
                                )
                                .tag(country)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())

                    },
                    validationType: .phoneNumber,
                    characterLimit: 10,
                    isValid: { valid in
                        phoneValid = valid
                    },
                    initialText: $phone
                )

                Spacer()

            }.padding()

            CustomRoundedButtonView(
                text: "Save Changes",
                width: 80,
                onTap: {
                    sureToUpdate.toggle()
                },
                isButtonEnabled: $isFormValid
            )
            .onChange(
                of: firstNameValid,
                { oldValue, newValue in
                    updateFormValidity()
                }
            )
            .onChange(
                of: lastNameValid,
                { oldValue, newValue in
                    updateFormValidity()
                }
            )
            .onChange(
                of: emailValid,
                { oldValue, newValue in
                    updateFormValidity()
                }
            )
            .onChange(
                of: phoneValid,
                { oldValue, newValue in
                    updateFormValidity()
                }
            )

        }.padding()
            .onAppear {
                email = viewModel.user?.email ?? ""
                firstName = viewModel.user?.firstName ?? ""
                lastName = viewModel.user?.lastName ?? ""
                phone = String(viewModel.user?.phone?.suffix(10) ?? "")
            }
            .alert(
                "are you sure you want to update your profile?",
                isPresented: $sureToUpdate
            ) {
                Button(
                    role: .destructive,
                    action: {
                        var codedPhone: String = phone
                        codedPhone.insert(
                            contentsOf: selectedCountry.code,
                            at: phone.startIndex)
                        viewModel.updateProfile(
                            firstName: firstName,
                            lastName: lastName,
                            email: email,
                            phone: codedPhone
                        )
                    },
                    label: {
                        Text("Update")
                            .foregroundStyle(.red)
                            .bold()

                    })

            } message: {
                Text(
                    "once you logout you will lose all your favorites"
                )
            }

    }
    func updateFormValidity() {
        isFormValid = [
            firstNameValid, lastNameValid, emailValid, phoneValid,
        ].allSatisfy { $0 }
    }
}

#Preview {
    EditProfile()
}
