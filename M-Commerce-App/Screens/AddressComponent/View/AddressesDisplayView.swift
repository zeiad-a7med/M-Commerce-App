//
//  AddressesDisplay.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 17/02/2025.
//

import SwiftUI

struct AddressesDisplayView: View {
    @StateObject var addressModel = AddressComponentViewModel()

    var body: some View {
        VStack {
            if addressModel.addressPackage.listOfAddress.isEmpty {
                ContentUnavailableView(
                    "There is no addresses", systemImage: "location.slash",
                    description: Text(
                        "add your addresses to make your order faster"
                    ))
            } else {
                if addressModel.addressPackage.defaultAddress != nil {
                    defaultAddresCard(
                        address: addressModel.addressPackage.defaultAddress!)
                }

                Text("Choose your Location")
                    .bold()
                    .padding(.trailing, 150)
                    .padding(.bottom, 5)
                    .font(.title2)
                ScrollView {

                    if addressModel.addressPackage.listOfAddress.count != 0 {
                        ForEach(
                            addressModel.addressPackage.listOfAddress, id: \.id
                        ) { element in
                            Button(action:{
                                NavigationManager.shared.push(
                                    .addressEdit(
                                        address: element,
                                        defaultAddress: addressModel
                                            .addressPackage
                                            .defaultAddress))
                            },label: {
                                addressCard(
                                    address: element,
                                    defaultAddress: addressModel.addressPackage
                                        .defaultAddress ?? Address()
                                )
                                .foregroundStyle(.black)
                            })
                            
                        }
                    }

                }.toolbar {
                    Button(action:{
                        NavigationManager.shared.push(.addressAdd)
                    },label: {
                        Image(systemName: "plus")
                            .padding(5)
                            .bold()
                            .foregroundStyle(.white)
                            .background(ThemeManager.darkPuble)
                            .clipShape(Circle())
                    })

                }
            }

        }
        .overlay {
            if addressModel.isLoading {
                VStack {
                    CustomProgressView()
                }.frame(
                    width: UIScreen.main.bounds.width,
                    height: UIScreen.main.bounds.height
                )
                .background(.primary.opacity(0.1))
            }
        }
        .navigationTitle("Address")
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    AddressesDisplayView()
}
