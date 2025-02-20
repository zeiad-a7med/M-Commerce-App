//
//  RowCard.swift
//  ShoppingCart
//
//  Created by Andrew Emad on 11/02/2025.
//

import SwiftUI

struct RowCard: View {
    @State var line : Line?
    @State var changeNumberOfItemInRow : ((Int)->(Void))?
    
   
    var body: some View {
        VStack{
            ZStack {
                imageCard(img: line?.variant?.image?.url ?? "")
                    .overlay(alignment: .bottomLeading){
                        NumberOfItems(numberOfItem: line?.quantity ?? 0){ count in
                            changeNumberOfItemInRow?(count)
                        }
                        .padding(.leading,50)
                        .padding(.bottom,20)
                    }
                
                //DeleteButton().offset(x:140,y:-33)
            }
            VStack(alignment: .leading){
                HStack {
                    Text(line?.variant?.productTitle ?? "")
                        .font(.title)
                    .padding(.leading)
                    Spacer()
                    Text(line?.lineCost?.totalAmount?.amount ?? "")
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

//#Preview {
//    RowCard()
//}
