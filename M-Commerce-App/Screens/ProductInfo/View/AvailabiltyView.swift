//
//  AvailabiltyView.swift
//  M-Commerce-App
//
//  Created by Zeiad on 25/02/2025.
//

import SwiftUI

struct AvailabiltyView: View {
    var title:String
    var amount:Int
    var body: some View {
        HStack{
            Text(title)
                .bold()
            Text("\(amount)")
                .bold()
        }
        .padding(10)
        .background(ThemeManager.darkPuble.opacity(0.4))
        .clipShape(
            RoundedCornerShape(
                corners: [.topRight, .topLeft , .bottomRight , .bottomLeft], radius: 40)
        ).padding(.bottom,10)
    }
}

#Preview {
    AvailabiltyView(title:"Available in stock",amount: 5)
}
