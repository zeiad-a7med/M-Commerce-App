//
//  EditAddress.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 16/02/2025.
//

import SwiftUI
import MapKit
struct EditAddress: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var addressListModel = AddressList()
    @State var index:Int
    @State var cameraPostion : MapCameraPosition = .automatic
    var body: some View {
  
  
                NavigationStack {
                    VStack {
                            NavigationLink {
                                AddLocation()
                            } label: {
                                Map(position: $cameraPostion)
                                    .frame(width: 330,height:150)
                                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                                    .padding()
                            }
                        VStack{
                            Text("Area")
                                .font(.subheadline)
                                .foregroundStyle(.tertiary)
                                .padding(.trailing,300)
                            TextField("Area", text: Binding(
                                            get: {
                                              
                                                addressListModel.listOfAddress?[index].Area ?? ""
                                            },
                                            set: { newValue in
                                         
                                                addressListModel.listOfAddress?[index].Area = newValue.isEmpty ? nil : newValue
                                            }
                                        )).padding()
                                .overlay{
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke()
                                        .foregroundStyle(ThemeManager.darkPuble)
                                }
                            HStack{
                                Text("Building")
                                    .font(.subheadline)
                                    .foregroundStyle(.tertiary)
                                    .padding(.trailing,100)
                                    .offset(x:-50)
                                  
                                Text("Apartment")
                                    .font(.subheadline)
                                    .foregroundStyle(.tertiary)
                                    .offset(x:-50)
                                   
                            }
                            HStack{
                                
                                TextField("Building", text: Binding(
                                                get: {
                                                  
                                                    addressListModel.listOfAddress?[index].building ?? ""
                                                },
                                                set: { newValue in
                                             
                                                    addressListModel.listOfAddress?[index].building = newValue.isEmpty ? nil : newValue
                                                }
                                )).padding()
                                    .overlay{
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke()
                                            .foregroundStyle(ThemeManager.darkPuble)
                                    }
                                TextField("Apatment number", text: Binding(
                                                get: {
                                                  
                                                    String(addressListModel.listOfAddress?[index].apartementNumber ?? 0)
                                                },
                                                set: { newValue in
                                             
                                                    addressListModel.listOfAddress?[index].apartementNumber = newValue.isEmpty ? nil : Int(newValue)
                                                }
                                            )).padding()
                                    .overlay{
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke()
                                            .foregroundStyle(ThemeManager.darkPuble)
                                    }
                            }
                            Text("Street")
                                .font(.subheadline)
                                .foregroundStyle(.tertiary)
                                .padding(.trailing,290)
                            TextField("Street", text: Binding(
                                            get: {
                                              
                                                addressListModel.listOfAddress?[index].Street ?? ""
                                            },
                                            set: { newValue in
                                         
                                                addressListModel.listOfAddress?[index].Street = newValue.isEmpty ? nil : newValue
                                            }
                            )).padding()
                                .overlay{
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke()
                                        .foregroundStyle(ThemeManager.darkPuble)
                                }

                        }.padding(30)
                            
                        Spacer()
                        CustomRoundedButtonView(text:"Done"){
                                dismiss()
                        }
                    }.toolbarBackground(.white)
                        .onAppear(){
                            if let temp = addressListModel.listOfAddress?[index].mapModel?.region {
                                cameraPostion = .region(temp)
                            }
                            
                        }
                }
              
                
              
          
                
            
         
       
    }
}

#Preview {
    EditAddress(index: 0 )
}
