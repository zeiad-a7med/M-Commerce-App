//
//  AddressesDisplay.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 17/02/2025.
//

import SwiftUI

struct AddressesDisplayView: View {
    @StateObject var addressModel = AddressComponentViewModel(id: "03c27d8e9f3f22fddb10010462ef36d3")
    var body: some View {
        VStack{
          
            
            NavigationStack {
                ScrollView {
                    ForEach(Array(addressModel.addressPackage.listOfAddress.enumerated()),id: \.offset) { index,element in
                        NavigationLink {
                          
                        } label: {
                            addressCard(index:index)
                                .foregroundStyle(.black)
                    }
                    }
                   
                }.toolbar{
                    NavigationLink {
                       // AddAddress()
                        
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
            }
            
        }

    }
}

#Preview {
    AddressesDisplayView()
}
