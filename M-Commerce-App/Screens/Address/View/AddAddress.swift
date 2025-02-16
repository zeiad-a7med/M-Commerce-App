////
////  EditAddress.swift
////  M-Commerce-App
////
////  Created by Andrew Emad on 16/02/2025.
////
//
//import SwiftUI
//import MapKit
//struct AddAddress: View {
//    @Environment(\.dismiss) private var dismiss
//    @ObservedObject var addressListModel = AddressList()
//    @State var cameraPostion : MapCameraPosition = .automatic
//    var body: some View {
//  
//  
//                NavigationStack {
//                    VStack {
//                            NavigationLink {
//                                AddLocation()
//                            } label: {
//                                Map(position: $cameraPostion)
//                                    .frame(width: 330,height:150)
//                                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
//                                    .padding()
//                            }
//                        VStack{
//                            Text("Area")
//                                .font(.subheadline)
//                                .foregroundStyle(.tertiary)
//                                .padding(.trailing,300)
//                            TextField("Area", text: Binding(
//                                            get: {
//                                              
//                                                ""
//                                            },
//                                            set: { newValue in
//                                         
//                                                addressListModel.listOfAddress?[-1].Area = newValue.isEmpty ? nil : newValue
//                                            }
//                                        )).padding()
//                                .overlay{
//                                    RoundedRectangle(cornerRadius: 15)
//                                        .stroke()
//                                        .foregroundStyle(ThemeManager.darkPuble)
//                                }
//                            HStack{
//                                Text("Building")
//                                    .font(.subheadline)
//                                    .foregroundStyle(.tertiary)
//                                    .padding(.trailing,100)
//                                    .offset(x:-50)
//                                  
//                                Text("Apartment")
//                                    .font(.subheadline)
//                                    .foregroundStyle(.tertiary)
//                                    .offset(x:-50)
//                                   
//                            }
//                            HStack{
//                                
//                                TextField("Building", text: Binding(
//                                                get: {
//                                                  
//                                                ""
//                                                },
//                                                set: { newValue in
//                                             
//                                                    addressListModel.listOfAddress?[-1].building = newValue.isEmpty ? nil : newValue
//                                                }
//                                )).padding()
//                                    .overlay{
//                                        RoundedRectangle(cornerRadius: 15)
//                                            .stroke()
//                                            .foregroundStyle(ThemeManager.darkPuble)
//                                    }
//                                TextField("Apatment number", text: Binding(
//                                                get: {
//                                                  
//                                                 ""
//                                                },
//                                                set: { newValue in
//                                             
//                                                    addressListModel.listOfAddress?[-1].apartementNumber = newValue.isEmpty ? nil : Int(newValue)
//                                                }
//                                            )).padding()
//                                    .overlay{
//                                        RoundedRectangle(cornerRadius: 15)
//                                            .stroke()
//                                            .foregroundStyle(ThemeManager.darkPuble)
//                                    }
//                            }
//                            Text("Street")
//                                .font(.subheadline)
//                                .foregroundStyle(.tertiary)
//                                .padding(.trailing,290)
//                            TextField("Street", text: Binding(
//                                            get: {
//                                              
//                                               ""
//                                            },
//                                            set: { newValue in
//                                         
//                                                addressListModel.listOfAddress?[-1].Street = newValue.isEmpty ? nil : newValue
//                                            }
//                            )).padding()
//                                .overlay{
//                                    RoundedRectangle(cornerRadius: 15)
//                                        .stroke()
//                                        .foregroundStyle(ThemeManager.darkPuble)
//                                }
//
//                        }.padding(30)
//                            
//                        Spacer()
//                        CustomRoundedButtonView(text:"Done"){
//                                dismiss()
//                        }
//                    }.toolbarBackground(.white)
//                        .onAppear(){
//                            if let temp = addressListModel.listOfAddress?[-1].mapModel?.region {
//                                cameraPostion = .region(temp)
//                            }
//                            
//                        }
//                }
//              
//                
//              
//          
//                
//            
//         
//       
//    }
//}
//
//#Preview {
//    AddAddress()
//}
