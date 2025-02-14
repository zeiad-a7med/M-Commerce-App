//
//  Currency.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 14/02/2025.
//

import SwiftUI

struct Currency: View {
    @State var currentCurrency : String = "USD"
    var body: some View {
        VStack {
           
                HStack {
                    Image(systemName: "dollarsign.circle")
                    Picker("choose a currency", selection: $currentCurrency){
                        Text("USD")
                            .tag("USD")
                            .foregroundStyle(ThemeManager.darkPuble)
                        Text("EGP")
                            .tag("EGP")
                            .foregroundStyle(ThemeManager.darkPuble)
                    }
                }
            
         
         
        }
    }
}

#Preview {
    Currency()
}
