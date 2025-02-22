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
                        Text("🇪🇬 EGP (EG Pound)")
                            .tag("EGP")
                            .foregroundStyle(ThemeManager.darkPuble)
                        Text("🇺🇸 USD (US Dollar)")
                            .tag("USD")
                            .foregroundStyle(ThemeManager.darkPuble)
                        Text("🇪🇺 EUR (Euro)")
                            .tag("EUR")
                            .foregroundStyle(ThemeManager.darkPuble)
                        Text("🇸🇦 SAR (Saudi Riyal)")
                            .tag("SAR")
                            .foregroundStyle(ThemeManager.darkPuble)
                        Text("🇦🇪 AED (UAE Dirham)")
                            .tag("AED")
                            .foregroundStyle(ThemeManager.darkPuble)
                        Text("🇰🇼 KWD (Kuwaiti Dinar)")
                            .tag("KWD")
                            .foregroundStyle(ThemeManager.darkPuble)
                        Text("🇶🇦 QAR (Qatari Riyal)")
                            .tag("QAR")
                            .foregroundStyle(ThemeManager.darkPuble)
                        Text("🇴🇲 OMR (Omani Rial)")
                            .tag("OMR")
                            .foregroundStyle(ThemeManager.darkPuble)
                        Text("🇧🇭 BHD (Bahraini Dinar)")
                            .tag("BHD")
                            .foregroundStyle(ThemeManager.darkPuble)
                        Text("🇨🇦 CAD (Canadian Dollar)")
                            .tag("CAD")
                            .foregroundStyle(ThemeManager.darkPuble)
                        Text("🇨🇳 CNY (Chinese Yuan)")
                            .tag("CNY")
                            .foregroundStyle(ThemeManager.darkPuble)
                        Text("🇩🇿 DZD (Algerian Dinar)")
                            .tag("DZD")
                            .foregroundStyle(ThemeManager.darkPuble)
                        Text("🇹🇳 TND (Tunisian Dinar)")
                            .tag("TND")
                            .foregroundStyle(ThemeManager.darkPuble)
                        Text("🇯🇵 JPY (Japanese Yen)")
                            .tag("JPY")
                            .foregroundStyle(ThemeManager.darkPuble)
                        Text("🇲🇦 MAD (Moroccan Dirham)")
                            .tag("MAD")
                            .foregroundStyle(ThemeManager.darkPuble)
                        Text("🇹🇷 TRY (Turkish Lira)")
                            .tag("MAD")
                            .foregroundStyle(ThemeManager.darkPuble)
                        Text("🇬🇧 GBP (British Pound)")
                            .tag("GBP")
                            .foregroundStyle(ThemeManager.darkPuble)
                    }
                }.onChange(of: currentCurrency) { value in
                    CurrencyManager.currentCurrencyRate.code = currentCurrency
                    CurrencyManager.shared.changeCurrentCurrencyRate(code: currentCurrency)
                }
                .onAppear {
                    currentCurrency = (CurrencyManager.currentCurrencyRate.code ?? "EGP")
                    CurrencyManager.shared.getAllCurrenciesExchangeRate()
                    CurrencyManager.shared.refreshCurrentCurrency()
                }
        }
    }
}

#Preview {
    Currency()
}
