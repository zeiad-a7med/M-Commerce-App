//
//  CurrencyManager.swift
//  M-Commerce-App
//
//  Created by Usef on 21/02/2025.
//

import Foundation
import SwiftData

class CurrencyManager : ObservableObject {
    static public let shared = CurrencyManager()
    
    static public let defaultCurrencyCode: String = "EGP"
    static public let defaultCurrencyValue: Double = 1.0
    static public var currentCurrencyRate: CurrencyRate = CurrencyRate(code: defaultCurrencyCode
                                                                       ,value: defaultCurrencyValue)
    @Published var currenciesData: [String: CurrencyRate]?
    @Published var isLoadingCurrencyData: Bool = false
    
    private var modelContext: ModelContext?
    
    private init() {
        getAllCurrenciesExchangeRate()
    }
    
    func setContext(_ context: ModelContext) {
        self.modelContext = context
        refreshCurrentCurrency()
    }
    
    func refreshCurrentCurrency() {
        guard let modelContext = modelContext else { return }
        do {
            let request = FetchDescriptor<CurrencyRate>()
            let currentCurrency1 = try modelContext.fetch(request)
            DispatchQueue.main.async {
                if let currentCurrency = currentCurrency1.first {
                    CurrencyManager.currentCurrencyRate = currentCurrency
                }
                print("current currency rate fetched successfully.. current currency rate is: \(CurrencyManager.currentCurrencyRate.value ?? 0.0) and code: \(CurrencyManager.currentCurrencyRate.code ?? "no data")")
            }
        } catch {
            print("Error fetching current currency rate: \(error)")
        }
    }
    
    func addToCurrentCurrencyRate(_ currentCurrentCurrencyRate: CurrencyRate) {
        guard let modelContext = modelContext else { return }
        do {
            let request = FetchDescriptor<CurrencyRate>()
            let currentCurrency1 = try modelContext.fetch(request)
            if currentCurrency1.isEmpty {
                modelContext.insert(currentCurrentCurrencyRate)
                try modelContext.save()
                refreshCurrentCurrency()
                print("current currency rate added successfully")
            }
        } catch {
            print("Error adding the current currency rate: \(error)")
        }
    }
    
    func restoreToDefault(_ currentCurrentCurrencyRate: CurrencyRate) {
        guard let modelContext = modelContext else { return }
        do {
            let request = FetchDescriptor<CurrencyRate>()
            let currentCurrency1 = try modelContext.fetch(request)
                if let currentCurrency = currentCurrency1.first {
                    CurrencyManager.currentCurrencyRate = currentCurrency
                    currentCurrency.value = CurrencyManager.defaultCurrencyValue
                    currentCurrency.code =  CurrencyManager.defaultCurrencyCode
                    try modelContext.save()
                    print("currentCurrency restored to the default")
                }
        } catch {
            print("Error restoring to the default currency: \(error)")
        }
    }
    
    func changeCurrentCurrencyRate(code: String) {
            guard let modelContext = modelContext else { return }
            CurrencyManager.currentCurrencyRate = (self.currenciesData?[code]) ?? CurrencyRate(code: "EGP",value: 1.0)
            do {
                let request = FetchDescriptor<CurrencyRate>()
                let currentCurrency1 = try modelContext.fetch(request)
                    if let currentCurrency = currentCurrency1.first {
                        currentCurrency.value = self.currenciesData?[code]?.value ?? 1.0
                        currentCurrency.code =  self.currenciesData?[code]?.code ?? "EGP"
                        try modelContext.save()
                        print("currentCurrencyRate changed successfully to \( self.currenciesData?[code]?.value ?? 1.0) and \(self.currenciesData?[code]?.code ?? "EGP")")
                    }else{
                        modelContext.insert(CurrencyRate(code: self.currenciesData?[code]?.code ,value: self.currenciesData?[code]?.value))
                        print("error getting currentCurrency")
                    }
            } catch {
                print("Error changing current currency rate: \(error)")
            }
        }
    
    func getAllCurrenciesExchangeRate() {
        isLoadingCurrencyData = true
        MoyaNetworkManager.shared.fetchCurrencyExchangeRates { result in
            switch result {
                case .success(let value):
                if let currencies = value.data {
                    self.currenciesData = currencies
                }
            case .failure(let error):
                print("Failure! Error: \(error.localizedDescription)")
            }
        }
        isLoadingCurrencyData = false
    }
}
