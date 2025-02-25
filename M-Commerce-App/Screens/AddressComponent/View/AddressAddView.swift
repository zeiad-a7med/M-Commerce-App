//
//  AddressAddView.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 17/02/2025.
//

import SwiftUI

struct AddressAddView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedCountry: Country = Constants.countries.first!
    @State var newAddress = Address()
    @State private var firstNameValid: Bool = false
    @State private var lastNameValid: Bool = false
    @State private var address1Valid: Bool = false
    @State private var address2Valid: Bool = false
    @State private var countryValid: Bool = false
    @State private var cityValid: Bool = false
    @State private var phoneValid: Bool = false
    @State private var zipValid: Bool = false

    @State private var isFormValid = false

    var body: some View {

        VStack {
            VStack {
                HStack {

                    CustomTextField(
                        placeholder: "First name",
                        onChange: { FirstName in
                            newAddress.firstName = FirstName
                        },
                        validationType: .name,
                        isValid: { valid in
                            firstNameValid = valid
                            updateFormValidity()

                        },
                        initialText: .constant("")
                    )
                    .padding(.leading, 25)
                    .disabled(false)
                    CustomTextField(
                        placeholder: "Last name",
                        onChange: { LastName in

                            newAddress.lastName = LastName

                        },
                        validationType: .name,
                        isValid: { valid in
                            lastNameValid = valid
                            updateFormValidity()
                        },
                        initialText: .constant("")
                    ).padding(.trailing, 25)
                        .disabled(false)

                }
                CustomTextField(
                    placeholder: "Address1",
                    onChange: { Address1 in

                        newAddress.address1 = Address1

                    },
                    validationType: .text,
                    isValid: { valid in
                        address1Valid = valid
                        updateFormValidity()
                    },
                    initialText: .constant("")
                )
                .padding(.trailing, 25)
                .padding(.leading, 25)

                CustomTextField(
                    placeholder: "Address2",
                    onChange: { Address2 in

                        newAddress.address2 = Address2

                    },
                    validationType: .text,
                    isValid: { valid in
                        address2Valid = valid
                        updateFormValidity()
                    },
                    initialText: .constant("")
                ).padding(.trailing, 25)
                    .padding(.leading, 25)
                HStack {
                    CustomTextField(
                        placeholder: "Country",
                        onChange: { Country in

                            newAddress.country = Country

                        },
                        validationType: .name,
                        isValid: { valid in
                            countryValid = valid
                            updateFormValidity()
                        },
                        initialText: .constant("")
                    )
                    .padding(.leading, 25)
                    CustomTextField(
                        placeholder: "City",
                        onChange: { city in

                            newAddress.city = city

                        },
                        validationType: .name,
                        isValid: { valid in
                            cityValid = valid
                            updateFormValidity()
                        },
                        initialText: .constant("")
                    ).padding(.trailing, 25)

                }

                CustomTextField(
                    placeholder: "Enter your phone number",
                    onChange: { phoneNumber in
                        newAddress.phone = phoneNumber
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
                        updateFormValidity()
                    },
                    initialText: .constant("")
                )
                .padding(.trailing, 25)
                .padding(.leading, 25)

                CustomTextField(
                    placeholder: "Zip",
                    onChange: { Zip in
                        newAddress.zip = Zip
                    },
                    validationType: .numeric,

                    characterLimit: 5,
                    isValid: { valid in
                        zipValid = valid
                        updateFormValidity()
                    },
                    initialText: .constant("")
                ).padding(.trailing, 25)
                    .padding(.leading, 25)

            }

            CustomRoundedButtonView(
                text: "Save address",
                onTap: {
                    let addressModel = AddressComponentViewModel()
                    addressModel.createAddresses(
                        AccessToken: AuthManager.shared.applicationUser?
                            .accessToken ?? "",
                        selectedAddress: newAddress)
                    SnackbarManager.shared.show(message: "Successfully Saved")
                    NavigationManager.shared.pop()

                }, isButtonEnabled: $isFormValid
            )
            .padding(.top, 200)

        }
        .navigationTitle("Add new Address")

    }
    func updateFormValidity() {
        isFormValid = [
            firstNameValid, lastNameValid, cityValid, zipValid, address1Valid,
            address2Valid, countryValid, phoneValid,
        ].allSatisfy { $0 }
    }
}

#Preview {
    AddressAddView()
}
