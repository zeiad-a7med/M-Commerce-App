//
//  AddressEditView.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 17/02/2025.
//

import SwiftUI

struct AddressEditView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var addressModel = AddressComponentViewModel(id: "03c27d8e9f3f22fddb10010462ef36d3")
    @State var index : Int?
    @State var isEditEnabled = false
    @State var isDeleteAlertShown : Bool = false
    var body: some View {
        if !isEmpty(){
            NavigationStack {
                VStack {
                    if let tempIndex = index{
                        VStack{
                            HStack{
                                CustomTextField(placeholder:addressModel.addressPackage.listOfAddress[tempIndex].firstName ?? "First name", onChange: { city in
                            
                                        addressModel.addressPackage.listOfAddress[tempIndex].firstName = city
                                   
                     
                                }, initialText: .constant(""))
                                    .padding(.leading, 25).disabled(!isEditEnabled)
                                CustomTextField(placeholder:addressModel.addressPackage.listOfAddress[tempIndex].lastName ?? "Last name", onChange: { city in
                               
                                    addressModel.addressPackage.listOfAddress[tempIndex].lastName = city
                                   
                     
                                }, initialText: .constant("")) .padding(.trailing,25)
                                   .disabled(!isEditEnabled)
                            }
                            CustomTextField(placeholder:  addressModel.addressPackage.listOfAddress[tempIndex].address1 ?? "Address1", onChange: { city in
                              
                                    addressModel.addressPackage.listOfAddress[tempIndex].address1 = city
                                
                 
                            }, initialText: .constant(""))
                            .padding(.trailing,25)
                            .padding(.leading, 25)
                            .disabled(!isEditEnabled)
                            CustomTextField(placeholder:addressModel.addressPackage.listOfAddress[tempIndex].address2 ?? "Address2", onChange: { city in
                        
                                    addressModel.addressPackage.listOfAddress[tempIndex].address2 = city
                                
                 
                            }, initialText: .constant("")) .padding(.trailing,25)
                                .padding(.leading, 25).disabled(!isEditEnabled)
                            HStack{
                                CustomTextField(placeholder:addressModel.addressPackage.listOfAddress[tempIndex].country ?? "Country", onChange: { city in
                           
                                        addressModel.addressPackage.listOfAddress[tempIndex].country = city
                                 
                     
                                }, initialText: .constant(""))
                                    .padding(.leading, 25).disabled(!isEditEnabled)
                                CustomTextField(placeholder:addressModel.addressPackage.listOfAddress[tempIndex].city ?? "City", onChange: { city in
                               
                                        addressModel.addressPackage.listOfAddress[tempIndex].city = city
                                   
                     
                                }, initialText: .constant("")) .padding(.trailing,25)
                                    .disabled(!isEditEnabled)
                            }
                            
                            CustomTextField(placeholder:addressModel.addressPackage.listOfAddress[tempIndex].phone ?? "Phone", onChange: { city in
                            
                                    addressModel.addressPackage.listOfAddress[tempIndex].phone = city
                             
                 
                            }, initialText: .constant("")) .padding(.trailing,25)
                                .padding(.leading, 25).disabled(!isEditEnabled)
                            CustomTextField(placeholder:addressModel.addressPackage.listOfAddress[tempIndex].zip ?? "Zip" ,onChange: { city in
                             
                                    addressModel.addressPackage.listOfAddress[tempIndex].zip = city
                               
                 
                            }, initialText: .constant("")) .padding(.trailing,25)
                                .padding(.leading, 25)
                                .disabled(!isEditEnabled)
                                
                        }
                       
                        if isEditEnabled{
                            CustomRoundedButtonView(text: "Save address",onTap: {
                                addressModel.updateAddresses(AccessToken: "03c27d8e9f3f22fddb10010462ef36d3", selectedAddress: addressModel.addressPackage.listOfAddress[tempIndex])
                                dismiss()
                                
                            }, isButtonEnabled: .constant(true))
                            .padding(.top,200)
                        }else{
                            CustomRoundedButtonView(text: "MakeDefault Address",onTap: {
                                addressModel.updateDefaulteAddress(AccessToken:"03c27d8e9f3f22fddb10010462ef36d3", selectedAddressId:addressModel.addressPackage.listOfAddress[tempIndex ].id ?? "")
                                dismiss()
                                
                            }, isButtonEnabled: .constant(true))
                            .padding(.top,200)
                            
                        }
                     
                    }
                   
                }.toolbar{
                    if isEditEnabled{
                        Button {
                            isDeleteAlertShown.toggle()
                           
                            
                        } label: {
                            Image(systemName: "xmark.bin")
                                .padding(5)
                                .bold()
                                .foregroundStyle(.white)
                                .background(.red)
                                .clipShape(Circle())
                        }.alert("Are you sure you want to delete the address", isPresented: $isDeleteAlertShown) {
                            Button("Yes", role: .destructive){
                                if let tempIndex = index{
                                    addressModel.deleteAddress(AccessToken:"03c27d8e9f3f22fddb10010462ef36d3", selectedAddressId:addressModel.addressPackage.listOfAddress[tempIndex ].id ?? "")
                                }
                                dismiss()
                            }
                            Button("cancel",role: .cancel){
                                
                            }
                        }
                    }else{
                        Button {
                            isEditEnabled.toggle()
                           
                            
                        } label: {
                            Image(systemName: "pencil")
                                .padding(5)
                                .bold()
                                .foregroundStyle(.white)
                                .background(ThemeManager.darkPuble)
                                .clipShape(Circle())
                        }
                    }
                  
                    

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
    AddressEditView()
}
