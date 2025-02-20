//
//  StatusAndPrice.swift
//  M-Commerce-App
//
//  Created by Usef on 19/02/2025.
//

import SwiftUI

struct StatusAndPrice: View {
    var status:String
    var price:String
    var isMyOrder:Bool
    var body: some View {
        VStack (alignment: .trailing){
            Rectangle()
                .foregroundStyle(.clear)
                .frame(width: 95, height: 30)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(isMyOrder ? .blue : .green
                                    , lineWidth: 1.5)
                        Text(status)
                            .font(.system(size: 13))
                            .foregroundStyle(isMyOrder ? .blue : .green)
                    }
                )
            Spacer()
            Text(price)
            
        }
        .frame(height: 90)
    }
}

#Preview {
    StatusAndPrice(status: "Completed", price: "$12", isMyOrder: false)
}
