//
//  Address.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 16/02/2025.
//

import SwiftUI

struct Address: View {
    @StateObject var addressListModel = AddressList()
    var body: some View {
        NavigationStack {
           
            List{
                Section(header:  Text("Addresses").foregroundStyle(ThemeManager.darkPuble).font(.headline)){
                    NavigationLink {
                        EditAddress(index: 0)
                        
                    } label: {
                        SettingsListRow(imageName: "mappin.and.ellipse.circle.fill",RowName: "AddressName")
                    
                    }

                      
                }
            
                
            }
            .toolbar{
                NavigationLink {
                    EditAddress( index: 0)
                    
                } label: {
                    Image(systemName: "plus")
                        .padding(5)
                        .bold()
                        .foregroundStyle(.white)
                        .background(ThemeManager.darkPuble)
                        .clipShape(Circle())
                }
                

            }
        }.toolbarBackground(.yellow, for: .navigationBar)
    }
}

#Preview {
    Address()
}
