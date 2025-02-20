//
//  SwiftUIView.swift
//  ShoppingCart
//
//  Created by Andrew Emad on 11/02/2025.
//

import SwiftUI

struct NumberOfItems: View {
    @State var numberOfItem : Int
    var max : Int?
    @State var changeNumberOfItem : ((Int)->(Void))?
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .opacity(0.8)
                .frame(width: 90 ,height: 30)
            .foregroundStyle(Color(#colorLiteral(red: 0.9364118576, green: 0.8771577477, blue: 0.8891954, alpha: 1)))
            .overlay{
                Button(action: {
                    if(max != nil){
                        if(numberOfItem < max!){
                            numberOfItem+=1
                            changeNumberOfItem?(numberOfItem)
                        }
                    }else{
                        numberOfItem+=1
                        changeNumberOfItem?(numberOfItem)
                    }

                }, label: {
                    Image(systemName: "plus")
                        .padding(5)
                        .background(.white)
                        .foregroundStyle(.black)
                        
                        .clipShape(Circle())
                }).offset(x:30)
                Button(action: {
                    if numberOfItem >  0{
                        numberOfItem -= 1
                    }
                    changeNumberOfItem?(numberOfItem)
                }, label: {
                    Image(systemName: "minus")
                        .padding(10)
                        .background(.white)
                        .foregroundStyle(.black)
                        
                        .clipShape(Circle())
                }).offset(x:-30)
                
            }
            Text("\(numberOfItem)")
            
               
        }
        
    }
}

#Preview {
    NumberOfItems(numberOfItem: 1,max: 10)
}
