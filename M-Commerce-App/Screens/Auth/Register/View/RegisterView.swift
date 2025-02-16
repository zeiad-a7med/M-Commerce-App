//
//  RegisterView.swift
//  M-Commerce-App
//
//  Created by Zeiad on 15/02/2025.
//

import SwiftUI

struct RegisterView: View {
    @State private var selectedCountry: Country = Constants.countries.first!
    @State private var isSecurePassword: Bool = false
    @State var currentCurrency: String = "USD"
    @State var firstName : String = ""
    @State var lastName : String = ""
    @State var email : String = ""
    @State var phone : String = ""
    @State var password : String = ""
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {

                    //fistName
                    VStack(alignment: .leading) {
                        Text("First name")
                            .font(.title2)
                        CustomSearchBarView(
                            placeholder: "Enter your first name",
                            onChange: { val in
                                firstName = val
                            },
                            prefix: { Image(systemName: "person") },
                            validationType: .name
                        )
                    }.padding(.bottom, 10)

                    //lastName
                    VStack(alignment: .leading) {
                        Text("Last name")
                            .font(.title2)
                        CustomSearchBarView(
                            placeholder: "Enter your first name",
                            onChange: { val in
                                lastName = val
                            },
                            prefix: { Image(systemName: "person") },
                            validationType: .name
                        )
                    }.padding(.bottom, 10)

                    //Email
                    VStack(alignment: .leading) {
                        Text("Email")
                            .font(.title2)
                        CustomSearchBarView(
                            placeholder: "Enter your first name",
                            onChange: { val in
                                email = val
                            },
                            prefix: { Image(systemName: "envelope") },
                            validationType: .email
                        )
                    }.padding(.bottom, 10)

                    //phone

                    VStack(alignment: .leading) {
                        Text("phone")
                            .font(.title2)
                        CustomSearchBarView(
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
                            validationType: .phoneNumber

                        )
                    }.padding(.bottom, 10)

                    //Password
                    VStack(alignment: .leading) {
                        Text("Password")
                            .font(.title2)
                        CustomSecureField(
                            placeholder: "Enter your first name",
                            onChange: { val in
                                password = val
                            },
                            prefix: { Image(systemName: "lock") }
                        )
                    }.padding(.bottom, 30)

                    CustomRoundedButtonView(text: "Create Account", width: 100)
                    {
                        var codedPhone : String = phone
                        codedPhone.insert(contentsOf: selectedCountry.code, at: phone.startIndex)
                        print(codedPhone)
                    }

                }.padding(20)
            }
        }.navigationTitle("Create account")
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
