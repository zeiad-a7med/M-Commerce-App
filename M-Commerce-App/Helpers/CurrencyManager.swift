//
//  CurrencyManager.swift
//  M-Commerce-App
//
//  Created by Usef on 21/02/2025.
//

import Foundation

class CurrencyManager : ObservableObject {
    static public let shared = CurrencyManager()
    static public var currentCurrencyCode: String = "EGP"
    static public var currentCurrencyValue: Double = 1.0
    @Published var currenciesData: CurrencyRate?
    @Published var isLoadingCurrencyData: Bool = false
    
    private init() {}
    
    func getCurrencyExchangeRate(targetCurrency: String) {
        isLoadingCurrencyData = true
        MoyaNetworkManager.shared.fetchCurrencyExchangeRates { result in
            switch result {
                case .success(let value):
                if let currencies = value.data {
                    if let targetCurrency = currencies[targetCurrency] {
                        self.currenciesData = targetCurrency
                        CurrencyManager.currentCurrencyValue = targetCurrency.value ?? 0.0
                        CurrencyManager.currentCurrencyCode = targetCurrency.code ?? ""
                        print("---------------------\(targetCurrency)")
                    }
                }
                print("---------------------",value.data?.count ?? 0.0)
            case .failure(let error):
                print("Failure! Error: \(error.localizedDescription)")
            }
        }
        isLoadingCurrencyData = false
    }
}
