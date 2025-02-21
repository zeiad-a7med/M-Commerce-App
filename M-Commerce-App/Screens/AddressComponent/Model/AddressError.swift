//
//  AddressError.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 21/02/2025.
//

import Foundation
enum AddressError : Error{
    case addressIsDefault
}

extension AddressError : LocalizedError{
    var errorDescription: String?{
        switch self{
        case .addressIsDefault:
            return NSLocalizedString("Cant delete default address", comment: "")
        }
    }
}
