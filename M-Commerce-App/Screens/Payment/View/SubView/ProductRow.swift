//
//  productRow.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 19/02/2025.
//

import SwiftUI

struct PaymentProductRow: View {
    @State var line : Line?
    @State var color : String?
    @State var size : String?
    var body: some View {
        VStack(alignment: .leading) {
           
            HStack{
              
                ImageView(url: line?.variant?.image?.url ?? "")
                    VStack(alignment:.leading) {
                        Text(line?.variant?.productTitle ?? "").bold()
                        HStack {
                            Text("Size:").bold()
                            Text(size ?? " ")
                        }
                        HStack {
                            Text("Color:").bold()
                            Text(color ?? " ")
                            Spacer()
                            Text("TotalPrice:").bold()
                            Text(line?.lineCost?.totalAmount?.amount ?? "")
                            Text(line?.variant?.price?.currencyCode ?? "")
                               
                        }
                    }
                    .onAppear(){
//                        if let variantComponents = line?.variant?.title?.components(separatedBy: " / "){
//                            if variantComponents.count >= 2{
//                                size = variantComponents.first
//                                color = variantComponents.last
//                            }
//
//                        }
                        
                   
                    }
                

            }.padding()
              
        }
    }
}

//#Preview {
//    productRow()
//}
//





