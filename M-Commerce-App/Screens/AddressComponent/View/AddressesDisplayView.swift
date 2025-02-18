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
          
            
//            NavigationStack {
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
                        ForEach(Array(addressModel.addressPackage.listOfAddress.enumerated()),id: \.offset) { index,element in
                            NavigationLink {
                                AddressEditView(address: element)
               
                            } label: {
                                addressCard(address:element)
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
                .navigationTitle("Address")
//            }
            
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now()+1, execute: {
                addressModel.fetchAddresses(AccessToken: "03c27d8e9f3f22fddb10010462ef36d3")
            })
        }
  

    }
}

#Preview {
    AddressesDisplayView()
}
