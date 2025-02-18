//
//  addressCard.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 17/02/2025.
//

import SwiftUI

struct addressCard: View {
    
    @State var isSelected :Bool = false
    @ObservedObject var addressModel = AddressComponentViewModel(id: "03c27d8e9f3f22fddb10010462ef36d3")
    @State var cardColor = ColoredPins.generateRandomColoredPin()
    @State var index : Int?
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                if  !isEmpty() {
                    if let tempIndex = index{
                        Text(addressModel.addressPackage.listOfAddress[tempIndex].city ?? "Cairo" )
                            .font(.headline)
                            .padding(.bottom,5)
                        Text(addressModel.addressPackage.listOfAddress[tempIndex].address1 ?? "Egypt")
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(.secondary)
                          
                    }
               
                }
             
             
            }
            Spacer()
            Image(cardColor)
                .resizable()
                .frame(width:40,height: 40)
                .foregroundStyle(ThemeManager.darkPuble)
                .padding()
                .overlay{
                    Circle()
                        .stroke(lineWidth: 5)
                        .foregroundStyle(isSelected ? ThemeManager.darkPuble : Color(#colorLiteral(red: 0.9071035385, green: 0.9071035385, blue: 0.9071035385, alpha: 1)))
                }
            
        }.padding()
            .overlay{
                RoundedRectangle(cornerRadius: 15)
                    .stroke(lineWidth: 2)
                    .foregroundStyle(isSelected ? ThemeManager.darkPuble : Color(#colorLiteral(red: 0.9071035385, green: 0.9071035385, blue: 0.9071035385, alpha: 1)))
                
            }.padding()
            .onAppear(){
                if let index = index{
                    if  addressModel.addressPackage.listOfAddress.count != 0{
                        addressModel.radioController.generateArray(count: addressModel.addressPackage.listOfAddress.count)
                        addressModel.radioController.boolArray[index].toggle()
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
    addressCard()
}
