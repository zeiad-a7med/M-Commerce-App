//
//  MoyaNetworkManagerExtension.swift
//  M-Commerce-App
//
//  Created by Usef on 21/02/2025.
//

import Foundation
import CombineMoya

extension MoyaNetworkManager {
    func fetchCurrencyExchangeRatesFromApi<T : Codable>(target: ApiHandler,complition:@escaping (Result<T,ApiErrors>)->Void) {
        provider.requestPublisher(target)
            .map{$0.data}
            .decode(type: T.self , decoder: JSONDecoder())
            .sink (receiveCompletion: { result in
                switch result {
                    case .failure(let error):
                    complition(.failure(.unableToComplete))
                case .finished:
                    break
                }
            }, receiveValue: { decodedData in
                print(decodedData)
                complition(.success(decodedData))
            })
            .store(in: &cancellables)
    }
}
