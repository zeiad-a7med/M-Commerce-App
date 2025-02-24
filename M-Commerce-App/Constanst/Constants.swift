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
            currencyName: "Egyptian Pound"),
        Country(
            name: "Saudi Arabia", code: "+966", flag: "🇸🇦", currencyCode: "SAR",
            currencyName: "Saudi Riyal"),
        Country(
            name: "United Arab Emirates", code: "+971", flag: "🇦🇪",
            currencyCode: "AED", currencyName: "UAE Dirham"),
        Country(
            name: "Qatar", code: "+974", flag: "🇶🇦", currencyCode: "QAR",
            currencyName: "Qatari Riyal"),
        Country(
            name: "Kuwait", code: "+965", flag: "🇰🇼", currencyCode: "KWD",
            currencyName: "Kuwaiti Dinar"),
        Country(
            name: "Bahrain", code: "+973", flag: "🇧🇭", currencyCode: "BHD",
            currencyName: "Bahraini Dinar"),
        Country(
            name: "Oman", code: "+968", flag: "🇴🇲", currencyCode: "OMR",
            currencyName: "Omani Rial"),
        Country(
            name: "Lebanon", code: "+961", flag: "🇱🇧", currencyCode: "LBP",
            currencyName: "Lebanese Pound"),
        Country(
            name: "Jordan", code: "+962", flag: "🇯🇴", currencyCode: "JOD",
            currencyName: "Jordanian Dinar"),
        Country(
            name: "Iraq", code: "+964", flag: "🇮🇶", currencyCode: "IQD",
            currencyName: "Iraqi Dinar"),
        Country(
            name: "Morocco", code: "+212", flag: "🇲🇦", currencyCode: "MAD",
            currencyName: "Moroccan Dirham"),
        Country(
            name: "Algeria", code: "+213", flag: "🇩🇿", currencyCode: "DZD",
            currencyName: "Algerian Dinar"),
        Country(
            name: "Tunisia", code: "+216", flag: "🇹🇳", currencyCode: "TND",
            currencyName: "Tunisian Dinar"),
        Country(
            name: "Sudan", code: "+249", flag: "🇸🇩", currencyCode: "SDG",
            currencyName: "Sudanese Pound"),
        Country(
            name: "Syria", code: "+963", flag: "🇸🇾", currencyCode: "SYP",
            currencyName: "Syrian Pound"),
        Country(
            name: "Palestine", code: "+970", flag: "🇵🇸", currencyCode: "ILS",
            currencyName: "Israeli Shekel"),
        Country(
            name: "Libya", code: "+218", flag: "🇱🇾", currencyCode: "LYD",
            currencyName: "Libyan Dinar"),
        Country(
            name: "Mauritania", code: "+222", flag: "🇲🇷", currencyCode: "MRU",
            currencyName: "Mauritanian Ouguiya"),
        Country(
            name: "Yemen", code: "+967", flag: "🇾🇪", currencyCode: "YER",
            currencyName: "Yemeni Rial"),
        Country(
            name: "United States", code: "+1", flag: "🇺🇸", currencyCode: "USD",
            currencyName: "US Dollar"),
        Country(
            name: "Canada", code: "+1", flag: "🇨🇦", currencyCode: "CAD",
            currencyName: "Canadian Dollar"),
        Country(
            name: "United Kingdom", code: "+44", flag: "🇬🇧", currencyCode: "GBP",
            currencyName: "British Pound"),
        Country(
            name: "Australia", code: "+61", flag: "🇦🇺", currencyCode: "AUD",
            currencyName: "Australian Dollar"),
        Country(
            name: "India", code: "+91", flag: "🇮🇳", currencyCode: "INR",
            currencyName: "Indian Rupee"),
        Country(
            name: "Germany", code: "+49", flag: "🇩🇪", currencyCode: "EUR",
            currencyName: "Euro"),
        Country(
            name: "France", code: "+33", flag: "🇫🇷", currencyCode: "EUR",
            currencyName: "Euro"),
        Country(
            name: "Italy", code: "+39", flag: "🇮🇹", currencyCode: "EUR",
            currencyName: "Euro"),
        Country(
            name: "Spain", code: "+34", flag: "🇪🇸", currencyCode: "EUR",
            currencyName: "Euro"),
        Country(
            name: "Brazil", code: "+55", flag: "🇧🇷", currencyCode: "BRL",
            currencyName: "Brazilian Real"),
    ]

    static let coupons: [Coupon] = [
        Coupon(code: "1", type: .fixedAmount, value: 100, title: "Summer Sale 100 OFF",image: "https://burst.shopifycdn.com/photos/childrens-clothing-in-funky-colors.jpg?width=4460&height=4460&exif=0&iptc=0"),
        Coupon(code: "#", type: .percentage, value: 50, title: "Discount 50% On Your Order",image: "https://burst.shopifycdn.com/photos/browsing-clothing.jpg?width=4460&height=4460&exif=0&iptc=0")
    ]
}
