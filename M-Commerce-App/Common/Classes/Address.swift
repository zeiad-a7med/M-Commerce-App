//
//  Address.swift
//  M-Commerce-App
//
//  Created by Zeiad on 15/02/2025.
//

import Foundation
struct Address: Codable ,Hashable{
    var id: String?
    var address1: String?
    var address2: String?
    var name: String?
    var phone: String?
    var city: String?
    var company: String?
    var country: String?
    var countryCode: String?
    var countryCodeV2: String?
    var firstName: String?
    var formatted: String?
    var formattedArea: String?
    var lastName: String?
    var latitude: Double?
    var longitude: Double?
    var province: String?
    var provinceCode: String?
    var zip: String?
}
