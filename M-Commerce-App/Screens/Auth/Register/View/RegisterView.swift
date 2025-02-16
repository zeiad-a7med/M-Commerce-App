//
//  RegisterView.swift
//  M-Commerce-App
//
//  Created by Zeiad on 15/02/2025.
//

import SwiftUI

struct RegisterView: View {
    @State private var selectedCountry: Country = Constants.countries.first!
    @State private var currentCurrency: String = "USD"

    @State private var firstName: String = ""
    @State private var firstNameValid: Bool = false

    @State private var lastName: String = ""
    @State private var lastNameValid: Bool = false

    @State private var email: String = ""
    @State private var emailValid: Bool = false

    @State private var phone: String = ""
    @State private var phoneValid: Bool = false

    @State private var password: String = ""
    @State private var passwordValid: Bool = false

    @State private var isFormValid = false

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {

                    //fistName
                    VStack(alignment: .leading) {
                        Text("First name")
                            .font(.title2)
                        CustomTextField(
                            placeholder: "Enter your first name",
                            onChange: { val in
                                firstName = val
                            },
                            prefix: { Image(systemName: "person") },
                            validationType: .name,
                            isValid: { valid in
                                firstNameValid = valid
                            }
                        )
                    }.padding(.bottom, 10)

                    //lastName
                    VStack(alignment: .leading) {
                        Text("Last name")
                            .font(.title2)
                        CustomTextField(
                            placeholder: "Enter your last name",
                            onChange: { val in
                                lastName = val
                            },
                            prefix: { Image(systemName: "person") },
                            validationType: .name,
                            isValid: { valid in
                                lastNameValid = valid
                            }
                        )
                    }.padding(.bottom, 10)

                    //Email
                    VStack(alignment: .leading) {
                        Text("Email")
                            .font(.title2)
                        CustomTextField(
                            placeholder: "Enter your email",
                            onChange: { val in
                                email = val
                            },
                            prefix: { Image(systemName: "envelope") },
                            validationType: .email,
                            isValid: { valid in
                                emailValid = valid
                            }
                        )
                    }.padding(.bottom, 10)

                    //phone

                    VStack(alignment: .leading) {
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
                            }
                        )
                    }.padding(.bottom, 10)

                    //Password
                    VStack(alignment: .leading) {
                        Text("Password")
                            .font(.title2)
                        CustomSecureField(
                            placeholder: "Enter your password",
                            onChange: { val in
                                password = val
                            },
                            prefix: { Image(systemName: "lock") },
                            validationType: .password,
                            isValid: { valid in
                                passwordValid = valid
                            }
                        )
                    }.padding(.bottom, 30)

                    CustomRoundedButtonView(
                        text: "Create Account", width: 100,
                        onTap: {
                            var codedPhone: String = phone
                            codedPhone.insert(
                                contentsOf: selectedCountry.code,
                                at: phone.startIndex)
                            print(codedPhone)
                        },
                        isButtonEnabled: $isFormValid
                    )
                    .onChange(of: firstNameValid, { oldValue, newValue in
                        updateFormValidity()
                    })
                    .onChange(of: lastNameValid, { oldValue, newValue in
                        updateFormValidity()
                    })
                    .onChange(of: emailValid, { oldValue, newValue in
                        updateFormValidity()
                    })
                    .onChange(of: phoneValid, { oldValue, newValue in
                        updateFormValidity()
                    })
                    .onChange(of: passwordValid, { oldValue, newValue in
                        updateFormValidity()
                    })

                }.padding(20)
            }
        }.navigationTitle("Create account")
    }
    func updateFormValidity() {
        isFormValid = [firstNameValid, lastNameValid, emailValid, phoneValid, passwordValid].allSatisfy { $0 }
    }
}

#Preview {
    RegisterView()
}
//lastName: "ahmed"
//            email: "zeiadahmed194@gmail.com"
//            phone: "+201018698825"
//            password: "zeiadahmed194"
//            acceptsMarketing: false
//            firstName: "zeiad"
