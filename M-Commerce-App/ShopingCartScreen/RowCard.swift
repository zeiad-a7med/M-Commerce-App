//
//  RowCard.swift
//  ShoppingCart
//
//  Created by Andrew Emad on 11/02/2025.
//

import SwiftUI

struct RowCard: View {
    var body: some View {
        ZStack {
            imageCard(img: "https://burst.shopifycdn.com/photos/black-sneakers-with-white-sole.jpg?width=4460&height=4460&exif=0&iptc=0")
            NumberOfItems(numberOfItem: 1).offset(x:-117,y:33)
            DeleteButton().offset(x:140,y:-33)
        }
        VStack(alignment: .leading){
           
               
               
            
         
            HStack {
                Text("ItemName")
                    .font(.title)
                .padding(.leading)
                Spacer()
                Text("32.00")
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

#Preview {
    RowCard()
}
