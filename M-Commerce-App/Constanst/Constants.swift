//
//  Constants.swift
//  M-Commerce-App
//
//  Created by Zeiad on 15/02/2025.
//

import Foundation

class Constants {
    static let countries: [Country] = [
        Country(
            name: "Egypt", code: "+20", flag: "🇪🇬", currencyCode: "EGP",
            currencyName: "Egyptian Pound", currencyKey: "EG"),
        Country(
            name: "Saudi Arabia", code: "+966", flag: "🇸🇦", currencyCode: "SAR",
            currencyName: "Saudi Riyal", currencyKey: "SA"),
        Country(
            name: "United Arab Emirates", code: "+971", flag: "🇦🇪",
            currencyCode: "AED", currencyName: "UAE Dirham", currencyKey: "AE"),
        Country(
            name: "Qatar", code: "+974", flag: "🇶🇦", currencyCode: "QAR",
            currencyName: "Qatari Riyal", currencyKey: "QA"),
        Country(
            name: "Kuwait", code: "+965", flag: "🇰🇼", currencyCode: "KWD",
            currencyName: "Kuwaiti Dinar", currencyKey: "KW"),
        Country(
            name: "Bahrain", code: "+973", flag: "🇧🇭", currencyCode: "BHD",
            currencyName: "Bahraini Dinar", currencyKey: "BH"),
        Country(
            name: "Oman", code: "+968", flag: "🇴🇲", currencyCode: "OMR",
            currencyName: "Omani Rial", currencyKey: "OM"),
        Country(
            name: "Lebanon", code: "+961", flag: "🇱🇧", currencyCode: "LBP",
            currencyName: "Lebanese Pound", currencyKey: "LB"),
        Country(
            name: "Jordan", code: "+962", flag: "🇯🇴", currencyCode: "JOD",
            currencyName: "Jordanian Dinar", currencyKey: "JO"),
        Country(
            name: "Iraq", code: "+964", flag: "🇮🇶", currencyCode: "IQD",
            currencyName: "Iraqi Dinar", currencyKey: "IQ"),
        Country(
            name: "Morocco", code: "+212", flag: "🇲🇦", currencyCode: "MAD",
            currencyName: "Moroccan Dirham", currencyKey: "MA"),
        Country(
            name: "Algeria", code: "+213", flag: "🇩🇿", currencyCode: "DZD",
            currencyName: "Algerian Dinar", currencyKey: "DZ"),
        Country(
            name: "Tunisia", code: "+216", flag: "🇹🇳", currencyCode: "TND",
            currencyName: "Tunisian Dinar", currencyKey: "TN"),
        Country(
            name: "Sudan", code: "+249", flag: "🇸🇩", currencyCode: "SDG",
            currencyName: "Sudanese Pound", currencyKey: "SD"),
        Country(
            name: "Syria", code: "+963", flag: "🇸🇾", currencyCode: "SYP",
            currencyName: "Syrian Pound", currencyKey: "SY"),
        Country(
            name: "Palestine", code: "+970", flag: "🇵🇸", currencyCode: "ILS",
            currencyName: "Israeli Shekel", currencyKey: "PS"),
        Country(
            name: "Libya", code: "+218", flag: "🇱🇾", currencyCode: "LYD",
            currencyName: "Libyan Dinar", currencyKey: "LY"),
        Country(
            name: "Mauritania", code: "+222", flag: "🇲🇷", currencyCode: "MRU",
            currencyName: "Mauritanian Ouguiya", currencyKey: "MR"),
        Country(
            name: "Yemen", code: "+967", flag: "🇾🇪", currencyCode: "YER",
            currencyName: "Yemeni Rial", currencyKey: "YE"),
        Country(
            name: "United States", code: "+1", flag: "🇺🇸", currencyCode: "USD",
            currencyName: "US Dollar", currencyKey: "US"),
        Country(
            name: "Canada", code: "+1", flag: "🇨🇦", currencyCode: "CAD",
            currencyName: "Canadian Dollar", currencyKey: "CA"),
        Country(
            name: "United Kingdom", code: "+44", flag: "🇬🇧", currencyCode: "GBP",
            currencyName: "British Pound", currencyKey: "GB"),
        Country(
            name: "Australia", code: "+61", flag: "🇦🇺", currencyCode: "AUD",
            currencyName: "Australian Dollar", currencyKey: "AU"),
        Country(
            name: "India", code: "+91", flag: "🇮🇳", currencyCode: "INR",
            currencyName: "Indian Rupee", currencyKey: "IN"),
        Country(
            name: "Germany", code: "+49", flag: "🇩🇪", currencyCode: "EUR",
            currencyName: "Euro", currencyKey: "DE"),
        Country(
            name: "France", code: "+33", flag: "🇫🇷", currencyCode: "EUR",
            currencyName: "Euro", currencyKey: "FR"),
        Country(
            name: "Italy", code: "+39", flag: "🇮🇹", currencyCode: "EUR",
            currencyName: "Euro", currencyKey: "IT"),
        Country(
            name: "Spain", code: "+34", flag: "🇪🇸", currencyCode: "EUR",
            currencyName: "Euro", currencyKey: "ES"),
        Country(
            name: "Brazil", code: "+55", flag: "🇧🇷", currencyCode: "BRL",
            currencyName: "Brazilian Real", currencyKey: "BR"),
    ]

    static let coupons: [Coupon] = [
        Coupon(id: "29241471861107", code: "50OFF",price_rule_id: "1659030798707", type: .percentage, value: 50,image: "https://burst.shopifycdn.com/photos/childrens-clothing-in-funky-colors.jpg?width=4460&height=4460&exif=0&iptc=0")
    ]
}
