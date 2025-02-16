//
//  GetProduct.swift
//  M-Commerce-App
//
//  Created by Zeiad on 13/02/2025.
//
import ShopifyAPIKit

extension RegisterMutation {
    static func parse(
        from userDTO: RegisterMutation.Data.CustomerCreate.Customer
    )
        -> ApplicationUser
    {
        var user = ApplicationUser(
            id: userDTO.id,
            displayName: userDTO.displayName,
            email: userDTO.email,
            firstName: userDTO.firstName,
            lastName: userDTO.lastName,
            phone: userDTO.phone
        )
        return user
    }
}
