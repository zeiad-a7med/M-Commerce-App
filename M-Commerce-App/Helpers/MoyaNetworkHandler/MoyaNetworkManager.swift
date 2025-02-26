//
//  NetworkManager.swift
//  M-Commerce-App
//
//  Created by Usef on 21/02/2025.
//

import Foundation
import Moya
import Combine

protocol Networkable {
    func fetchCurrencyExchangeRates(complition:@escaping (Result<CurrencyModel,ApiErrors>)->Void )
}

class MoyaNetworkManager: Networkable {
    var cancellables: Set<AnyCancellable> = []
    var provider = MoyaProvider<ApiHandler>()
    static public let shared = MoyaNetworkManager()
    private init() {}
    func fetchCurrencyExchangeRates(complition:@escaping (Result<CurrencyModel, ApiErrors>) -> Void) {
        fetchCurrencyExchangeRatesFromApi(target: .getLatestCurrency , complition: complition)
    }
}
