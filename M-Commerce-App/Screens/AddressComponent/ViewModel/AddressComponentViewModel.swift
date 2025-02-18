//
//  AddressComponentViewModel.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 17/02/2025.
//

import Foundation
import ShopifyAPIKit

final class AddressComponentViewModel : ObservableObject {
    @Published var addressPackage = AddressResponse()
    @Published var  radioController = RadioList()
    init(id: String){
        fetchAddresses(id: id)

    }
    func fetchAddresses(id: String){
        ApolloNetwokService.shared.apollo.fetch(query: ProfileQuery(customerAccessToken: id)){result in
            switch result {
            case .success(let graphQlResult):
                if let data = graphQlResult.data?.customer?.addresses.nodes{
                    data.forEach { result in
                        let tempAddress = Address(id: result.id, address1: result.address1, address2: result.address2, name: result.name, phone: result.phone, city: result.city, company: result.company, country: result.country,  firstName: result.firstName, lastName: result.lastName, latitude: result.latitude, longitude: result.longitude, province: result.province, provinceCode: result.provinceCode, zip: result.zip)
                        self.addressPackage.listOfAddress.append(tempAddress)
                    }
                    self.addressPackage.success=true
                    self.radioController.generateArray(count:self.addressPackage.listOfAddress.count)
                }
            case .failure(let error):
                self.addressPackage.success = false
                self.addressPackage.messages = [error.localizedDescription]
            }
            
        }
    }
}
