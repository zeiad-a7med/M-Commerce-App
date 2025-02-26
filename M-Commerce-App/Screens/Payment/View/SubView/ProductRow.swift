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
                            Text("Variant: ").bold()
                            Text(line?.variant?.title ?? " ")
                            Spacer()
                            Text("TotalPrice:").bold()
                            
                            Text(String(format: "%.2f", (Double(
                                line?.lineCost?.totalAmount?.amount ?? "0") ?? 0)
                            * (CurrencyManager.currentCurrencyRate.value ?? 1.0)))
                            Text(CurrencyManager.currentCurrencyRate.code ?? "EGP")
                               
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





