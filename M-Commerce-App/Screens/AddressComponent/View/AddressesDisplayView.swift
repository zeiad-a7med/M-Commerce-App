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
        VStack{
          
            
    //        NavigationStack {
                if addressModel.addressPackage.defaultAddress != nil{
                    defaultAddresCard(address:addressModel.addressPackage.defaultAddress!)
                }
                Text("Choose your Location")
                    .bold()
                    .padding(.trailing,150)
                    .padding(.bottom,5)
                    .font(.title2)
                ScrollView {
                    
                    if  addressModel.addressPackage.listOfAddress.count != 0 {
                        ForEach(addressModel.addressPackage.listOfAddress,id: \.id) {element in
                            NavigationLink {
                                AddressEditView(address: element,defaultAddress: addressModel.addressPackage.defaultAddress )
               
                            } label: {
                                addressCard(address:element,defaultAddress: addressModel.addressPackage.defaultAddress ?? Address())
                                    .foregroundStyle(.black)
                        }
                        }
                    }
                   
                }.toolbar{
                    NavigationLink {
                       AddressAddView()
                        
                    } label: {
                        Image(systemName: "plus")
                            .padding(5)
                            .bold()
                            .foregroundStyle(.white)
                            .background(ThemeManager.darkPuble)
                            .clipShape(Circle())
                    }
                    

                }
                
         //   }
            
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now()+1, execute: {
               
                addressModel.fetchAddresses(AccessToken: AuthManager.shared.applicationUser?.accessToken ?? " ")
            })
        }
        .navigationTitle("Address")
        .toolbar(.hidden,for: .tabBar)
    }
}

#Preview {
    AddressesDisplayView()
}
