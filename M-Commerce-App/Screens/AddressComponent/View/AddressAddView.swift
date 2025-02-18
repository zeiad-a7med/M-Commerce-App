//
//  AddressAddView.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 17/02/2025.
//

import SwiftUI

struct AddressAddView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var addressModel = AddressComponentViewModel(id: "03c27d8e9f3f22fddb10010462ef36d3")
    @State var newAddress =  Address()
    var body: some View {
   
        if !isEmpty() {
            NavigationStack {
                    VStack {
                        
                            VStack{
                                HStack{
                                    CustomTextField(placeholder:"First name", onChange: { FirstName in
                                
                                        newAddress.city = FirstName
                                       
                         
                                    }, initialText: .constant(""))
                                        .padding(.leading, 25)
                                    CustomTextField(placeholder: "Last name", onChange: { LastName in
                                   
                                        newAddress.lastName = LastName
                                       
                         
                                    }, initialText: .constant("")) .padding(.trailing,25)
                                      
                                }
                                CustomTextField(placeholder: "Address1", onChange: { Address1 in
                                  
                                    newAddress.address1 = Address1
                                    
                     
                                }, initialText: .constant(""))
                                .padding(.trailing,25)
                                .padding(.leading, 25)
                               
                                CustomTextField(placeholder: "Address2", onChange: { Address2 in
                            
                                        newAddress.address2 = Address2
                                    
                     
                                }, initialText: .constant("")) .padding(.trailing,25)
                                    .padding(.leading, 25)
                                HStack{
                                    CustomTextField(placeholder: "Country", onChange: { Country in
                               
                                            newAddress.country = Country
                                     
                         
                                    }, initialText: .constant(""))
                                        .padding(.leading, 25)
                                    CustomTextField(placeholder: "City", onChange: { city in
                                   
                                        newAddress.city = city
                                       
                         
                                    }, initialText: .constant("")) .padding(.trailing,25)
                                       
                                }
                                
                                CustomTextField(placeholder: "Phone", onChange: { Phone in
                                
                                    newAddress.phone = Phone
                                 
                     
                                }, initialText: .constant("")) .padding(.trailing,25)
                                    .padding(.leading, 25)
                                CustomTextField(placeholder: "Zip" ,onChange: { Zip in
                                 
                                    newAddress.zip = Zip
                                   
                     
                                }, initialText: .constant("")) .padding(.trailing,25)
                                    .padding(.leading, 25)
                                  
                                    
                            }
                           
                       
                                CustomRoundedButtonView(text: "Save address",onTap: {
                                
                                 
                                        addressModel.createAddresses(AccessToken: "03c27d8e9f3f22fddb10010462ef36d3", selectedAddress: newAddress)
                                    
                                  
                                    dismiss()
                                    
                                }, isButtonEnabled: .constant(true))
                                .padding(.top,200)
                            
                         
                        }
                       
            }
        }
            
           
        
       
    }
    func isEmpty() ->Bool{
        if addressModel.addressPackage.listOfAddress.count == 0{
      
            return true
        }
     
        return false
    }
}

#Preview {
    AddressAddView()
}
