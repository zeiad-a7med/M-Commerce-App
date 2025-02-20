//
//  ProductDetailsView.swift
//  M-Commerce-App
//
//  Created by Usef on 19/02/2025.
//

import SwiftUI

struct ProductDetailsView: View {
    var name:String
    var color:String
    var quantity:Int
    var body: some View {
        LazyVStack (alignment: .leading,spacing: 3){
            Text(name)
                .bold()
                .frame(maxHeight: 55)
            KeyAndValueTextView(key: "Color: ", value: color)
            KeyAndValueTextView(key: "Qty: ", value: "\(quantity)")
        }
        .frame(maxWidth: UIScreen.main.bounds.width/3.3)
    }
}

#Preview {
    ProductDetailsView(name: "STW Hoddie Oversized", color: "Black", quantity: 13)
}
