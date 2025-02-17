//
//  GetProduct.swift
//  M-Commerce-App
//
//  Created by Zeiad on 13/02/2025.
//
import ShopifyAPIKit

extension UpdateProfileMutation {
    static func parse(
        from customerDTO: UpdateProfileMutation.Data.CustomerUpdate.Customer,
        accessToken: String?,
        accessTokenExpiresAt: String?
    )
    -> ApplicationUser
    {
        
        var addresses : [Address] = []
        
        customerDTO.addresses.nodes.forEach { addressDTO in
            addresses.append(
                Address(
                    id: addressDTO.id,
                    address1: addressDTO.address1,
                    address2: addressDTO.address2,
                    name: addressDTO.name,
                    phone: addressDTO.phone,
                    city: addressDTO.city,
                    company: addressDTO.company,
                    country: addressDTO.country,
                    countryCode: addressDTO.countryCode,
                    countryCodeV2: addressDTO.countryCodeV2?.rawValue,
                    firstName: addressDTO.firstName,
                    formattedArea: addressDTO.formattedArea,
                    lastName: addressDTO.lastName,
                    latitude: addressDTO.latitude,
                    longitude: addressDTO.longitude,
                    province: addressDTO.province,
                    provinceCode: addressDTO.provinceCode,
                    zip: addressDTO.zip
                )
            )
        }
        var defaultAddress = customerDTO.defaultAddress != nil ? Address(
            id: customerDTO.defaultAddress?.id,
            address1: customerDTO.defaultAddress?.address1,
            address2: customerDTO.defaultAddress?.address2,
            name: customerDTO.defaultAddress?.name,
            phone: customerDTO.defaultAddress?.phone,
            city: customerDTO.defaultAddress?.city,
            company: customerDTO.defaultAddress?.company,
            country: customerDTO.defaultAddress?.country,
            countryCode: customerDTO.defaultAddress?.countryCode,
            countryCodeV2: customerDTO.defaultAddress?.countryCodeV2?.rawValue,
            firstName: customerDTO.defaultAddress?.firstName,
            formattedArea: customerDTO.defaultAddress?.formattedArea,
            lastName: customerDTO.defaultAddress?.lastName,
            latitude: customerDTO.defaultAddress?.latitude,
            longitude: customerDTO.defaultAddress?.longitude,
            province: customerDTO.defaultAddress?.province,
            provinceCode: customerDTO.defaultAddress?.provinceCode,
            zip: customerDTO.defaultAddress?.zip
        ):nil
    
        let user : ApplicationUser = ApplicationUser(
            id:customerDTO.id,
            accessToken:accessToken,
            accessTokenExpiresAt:accessTokenExpiresAt,
            displayName:customerDTO.displayName,
            email:customerDTO.email,
            firstName:customerDTO.firstName,
            lastName:customerDTO.lastName,
            numberOfOrders:Int(String(customerDTO.numberOfOrders)),
            phone:customerDTO.phone,
            addresses:addresses,
            defaultAddress:nil,
            orders:nil
        )
        return user
    }
}
