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
            return "cur_live_WxAuo7xlBF0ZsSSxC42ftAcsDT3FVvec7QELytdR"
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
            return .requestParameters(parameters: ["apikey":"\(apiKey)","currencies": "CNY,JPY,GBP,TRY,TND,MAD,DZD,EUR,USD,CAD,SAR,AED,KWD,QAR,OMR,BHD",
                "base_currency": "EGP"], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}

