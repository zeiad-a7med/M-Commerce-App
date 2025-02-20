//
//  OrderCard.swift
//  M-Commerce-App
//
//  Created by Usef on 19/02/2025.
//

import SwiftUI

struct OrderCard: View  {
    var imgUrl:String
    var prodTitle:String
    var vendor:String
    var prodVarient:String
    var prodPrice:String
    var prodQty:Int
    var isMyOrder:Bool
    let detailsDest: AnyView
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 200)
                .foregroundStyle(.WILDID)
                .cornerRadius(20)
                .padding([.leading, .trailing])
                .padding(.top,5)
                .shadow(radius: 0.5)
            VStack {
                HStack {
                    ProductImageView(imgUrlStr: imgUrl)
                    LazyVStack (alignment: .leading,spacing: 3){
                        Text(prodTitle)
                            .font(.system(size: 15))
                            .bold()
                            .frame(maxHeight: 55)
                            
                        Text(vendor).font(.caption).foregroundColor(.secondary)
                        KeyAndValueTextView(key: "Qty: ", value: "\(prodQty)       varient: \(prodVarient)")
                        KeyAndValueTextView(key: "price: ", value: "\(prodPrice)")
                    }
                    .frame(maxWidth: UIScreen.main.bounds.width/1.7)
                }
                HStack (spacing: 20){
                    CustomButtonWith(width: 250, color: .WILDID, borderColor: .secondary.opacity(0.3), text: "View Product", textColor: .primary, destination: detailsDest)
                }.padding(7)
            }
            Spacer()
        }
        
    }
}

#Preview {
    NavigationView {
        OrderCard(imgUrl: "https://devwear.co/cdn/shop/files/HOODIE-74.2.png?v=1706656782", prodTitle: "Abo Sami Hoodie", vendor: "Adidas", prodVarient: "Brown", prodPrice: "$234", prodQty: 12, isMyOrder: true, detailsDest: AnyView(Text("Details")))
    }
}
