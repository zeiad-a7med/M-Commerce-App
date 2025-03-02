//
//  ApiHandler.swift
//  M-Commerce-App
//
//  Created by Usef on 21/02/2025.
//

import Foundation
import Moya


enum ApiHandler {
    case getLatestCurrency
}

extension ApiHandler : TargetType {
    var baseURL: URL {
        switch self {
        case .getLatestCurrency:
            return URL(string: "https://api.currencyapi.com/v3")!
        }
    }
    
    var apiKey: String {
        switch self {
        case .getLatestCurrency:
            return "cur_live_AnT3nfPNRCTHkFDJpaeYMrfkma3y9LlLNVt10PvT"
        }
    }
    var path: String {
        switch self {
        case .getLatestCurrency:
            return "/latest"
        }
    }

    var method: Moya.Method {
            switch self {
            case .getLatestCurrency:
                return .get
            }
        }

    var task: Moya.Task {
        switch self {
        case .getLatestCurrency:
            return .requestParameters(parameters: ["apikey":"\(apiKey)","currencies": "EGP,SAR,AED,QAR,KWD,BHD,OMR,LBP,JOD,IQD,MAD,DZD,TND,SDG,SYP,ILS,LYD,MRU,YER,USD,CAD,GBP,AUD,INR,EUR,EUR,EUR,EUR,BRL",
                "base_currency": "EGP"], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}

