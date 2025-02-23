//
//  Currency.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 14/02/2025.
//

import SwiftUI

struct Currency: View {
    @State var currentCurrency : String = (CurrencyManager.currentCurrencyRate.code ?? "EGP")
    var body: some View {
        VStack {
           
                HStack {
                    Image(systemName: "dollarsign.circle")
                    Picker("choose a currency", selection: $currentCurrency){
                        ForEach(Constants.countries, id: \.name) { country in
                            CurrencyFlagAndCode(flag: country.flag, code: country.currencyCode ?? "EG Pound", name: country.currencyName ?? "EGP")
                        }
                    }
                }.onChange(of: currentCurrency) { value in
                    CurrencyManager.currentCurrencyRate.code = currentCurrency
                    CurrencyManager.shared.changeCurrentCurrencyRate(code: currentCurrency)
                }
                .onAppear {
                    CurrencyManager.shared.refreshCurrentCurrency()
                    currentCurrency = (CurrencyManager.currentCurrencyRate.code ?? "")
                }
        }
    }
}

#Preview {
    Currency()
}

struct CurrencyFlagAndCode: View {
    var flag:String
    var code:String
    var name:String
    var body: some View {
        Text("\(flag) \(code) (\(name)")
            .tag(code)
            .foregroundStyle(ThemeManager.darkPuble)
    }
}
