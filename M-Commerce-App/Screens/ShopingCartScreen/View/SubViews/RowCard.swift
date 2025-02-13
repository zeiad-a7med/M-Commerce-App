//
//  RowCard.swift
//  ShoppingCart
//
//  Created by Andrew Emad on 11/02/2025.
//

import SwiftUI

struct RowCard: View {
    @State var item : CartItem?
    @State var changeNumberOfItemInRow : ((Int,Bool)->(Void))?
    
   
    var body: some View {
        VStack{
            ZStack {
                imageCard(img: item?.image ?? "")
                NumberOfItems(numberOfItem: item?.count ?? 1){ number , sign in
                    changeNumberOfItemInRow?(number,sign)
                    
                }.offset(x:-117,y:33)
                //DeleteButton().offset(x:140,y:-33)
            }
            VStack(alignment: .leading){
                HStack {
                    Text(item?.name ?? "aaa")
                        .font(.title)
                    .padding(.leading)
                    Spacer()
                    Text(String(item?.price ?? 0.0))
                        .padding(.trailing)
                        .font(.largeTitle)
                }
                 
                Text("Color: Brown")
                    .font(.title2)
                    .padding(.leading)
                    .foregroundStyle(.secondary)
                    .font(.subheadline)
                
                
            }

        }
    }
     
}

#Preview {
    RowCard()
}
