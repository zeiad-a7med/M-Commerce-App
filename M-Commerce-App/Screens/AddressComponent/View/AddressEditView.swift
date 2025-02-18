//
//  AddressEditView.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 17/02/2025.
//

import SwiftUI

struct AddressEditView: View {
    @Environment(\.dismiss) private var dismiss
    @State var address: Address
    @State var isEditEnabled: Bool = false
    @State var isDeleteAlertShown: Bool = false
    var body: some View {

//        NavigationStack {
            VStack {
                VStack {
                    HStack {
                        CustomTextField(
                            placeholder: address.firstName ?? "First name",
                            onChange: { city in

                                address.firstName = city

                            }, initialText: .constant("")
                        )
                        .padding(.leading, 25).disabled(!isEditEnabled)
                        CustomTextField(
                            placeholder: address.lastName ?? "Last name",
                            onChange: { city in

                                address.lastName = city

                            }, initialText: .constant("")
                        ).padding(.trailing, 25)
                            .disabled(!isEditEnabled)
                    }
                    CustomTextField(
                        placeholder: address.address1 ?? "Address1",
                        onChange: { city in

                            address.address1 = city

                        }, initialText: .constant("")
                    )
                    .padding(.trailing, 25)
                    .padding(.leading, 25)
                    .disabled(!isEditEnabled)
                    CustomTextField(
                        placeholder: address.address2 ?? "Address2",
                        onChange: { city in

                            address.address2 = city

                        }, initialText: .constant("")
                    ).padding(.trailing, 25)
                        .padding(.leading, 25).disabled(!isEditEnabled)
                    HStack {
                        CustomTextField(
                            placeholder: address.country ?? "Country",
                            onChange: { city in

                                address.country = city

                            }, initialText: .constant("")
                        )
                        .padding(.leading, 25).disabled(!isEditEnabled)
                        CustomTextField(
                            placeholder: address.city ?? "City",
                            onChange: { city in
                                address.city = city

                            }, initialText: .constant("")
                        ).padding(.trailing, 25)
                            .disabled(!isEditEnabled)
                    }

                    CustomTextField(
                        placeholder: address.phone ?? "Phone",
                        onChange: { city in
                            address.phone = city

                        }, initialText: .constant("")
                    ).padding(.trailing, 25)
                        .padding(.leading, 25).disabled(!isEditEnabled)
                    CustomTextField(
                        placeholder: address.zip ?? "Zip",
                        onChange: { city in
                            address.zip = city

                        }, initialText: .constant("")
                    ).padding(.trailing, 25)
                        .padding(.leading, 25)
                        .disabled(!isEditEnabled)

                }
                if isEditEnabled {
                    CustomRoundedButtonView(
                        text: "Save address",
                        onTap: {
                            var addressModel = AddressComponentViewModel()
                            addressModel.updateAddresses(
                                accessToken:
                                    "03c27d8e9f3f22fddb10010462ef36d3",
                                selectedAddress: address)
                             ()

                        }, isButtonEnabled: .constant(true)
                    )
                    .padding(.top, 200)
                } else {
                    CustomRoundedButtonView(
                        text: "MakeDefault Address",
                        onTap: {
                            var addressModel = AddressComponentViewModel()
                            addressModel.updateDefaulteAddress(
                                AccessToken:
                                    "03c27d8e9f3f22fddb10010462ef36d3",
                                selectedAddressId: address.id ?? "")
                            dismiss()

                        }, isButtonEnabled: .constant(true)
                    )
                    .padding(.top, 200)

                }

            }
            .toolbar {
                if isEditEnabled {
                    Button {
                        withAnimation {
                            isDeleteAlertShown.toggle()
                        }
                    } label: {
                        Image(systemName: "xmark.bin")
                            .padding(5)
                            .bold()
                            .foregroundStyle(.white)
                            .background(.red)
                            .clipShape(Circle())
                    }
                    .transition(.scale) // Smooth appearance transition
                    .alert(
                        "Are you sure you want to delete the address",
                        isPresented: $isDeleteAlertShown
                    ) {
                        Button("Yes", role: .destructive) {
                            var addressModel = AddressComponentViewModel()
                            addressModel.deleteAddress(
                                AccessToken: "03c27d8e9f3f22fddb10010462ef36d3",
                                selectedAddressId: address.id ?? ""
                            )
                            dismiss()
                        }
                        Button("Cancel", role: .cancel) { }
                    }

                    Button {
                        withAnimation {
                            isEditEnabled.toggle()
                        }
                    } label: {
                        Image(systemName: "pencil.slash")
                            .padding(5)
                            .bold()
                            .foregroundStyle(.white)
                            .background(ThemeManager.darkPuble)
                            .clipShape(Circle())
                    }
                    .transition(.opacity.combined(with: .scale)) // Fade & scale transition

                } else {
                    Button {
                        withAnimation {
                            isEditEnabled.toggle()
                        }
                    } label: {
                        Image(systemName: "pencil")
                            .padding(5)
                            .bold()
                            .foregroundStyle(.white)
                            .background(ThemeManager.darkPuble)
                            .clipShape(Circle())
                    }
                    .transition(.opacity.combined(with: .scale)) // Fade & scale transition
                }
            }.animation(.easeInOut(duration: 0.3), value: isEditEnabled)
//        }

    }
}

//#Preview {
//    AddressEditView()
//}
