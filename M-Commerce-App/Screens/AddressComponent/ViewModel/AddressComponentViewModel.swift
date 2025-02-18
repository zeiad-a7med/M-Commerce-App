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
        fetchAddresses(AccessToken: id)

    }
    func fetchAddresses(AccessToken: String){
        ApolloNetwokService.shared.apollo.fetch(query: AddressQuery(customerAccessToken: AccessToken)){result in
            switch result {
            case .success(let graphQlResult):
                if let data = graphQlResult.data?.customer?.defaultAddress{
                    self.addressPackage.defaultAddress = Address(id: data.id, address1: data.address1, address2: data.address2, name: data.name, phone: data.phone, city: data.city, company: data.company, country: data.country,  firstName: data.firstName, lastName: data.lastName, latitude: data.latitude, longitude: data.longitude, province: data.province, provinceCode: data.provinceCode, zip: data.zip)
                    
                }
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
    func updateAddresses(AccessToken: String ,selectedAddress: Address){
        ApolloNetwokService.shared.apollo.perform(mutation: AddressUpdateMutation(customerAccessToken: AccessToken, id: selectedAddress.id ?? " ", zip: selectedAddress.zip ?? " ", phone: selectedAddress.phone ?? " ", firstName: selectedAddress.firstName ?? "", lastName: selectedAddress.lastName ?? "", country: selectedAddress.country ?? "", city: selectedAddress.city ?? "", address1: selectedAddress.address1 ?? "", address2: selectedAddress.address2 ?? "")){result in
            switch result {
            case .success(let graphQlResult):
               print("success")
                if let result = graphQlResult.data?.customerAddressUpdate?.customerAddress{
                    let tempAddress = Address(id: result.id, address1: result.address1, address2: result.address2, name: result.name, phone: result.phone, city: result.city, company: result.company, country: result.country,  firstName: result.firstName, lastName: result.lastName, latitude: result.latitude, longitude: result.longitude, province: result.province, provinceCode: result.provinceCode, zip: result.zip)
                    if let index = self.addressPackage.listOfAddress.firstIndex(where: { Address in
                        return Address.id == tempAddress.id
                    }){
                        self.addressPackage.listOfAddress[index] = tempAddress
                    }
                    
                }
                self.addressPackage.success = true
            case .failure(let error):
                self.addressPackage.success = false
                self.addressPackage.messages = [error.localizedDescription]
                print("failed")
            }
            
        }
    }
    func updateDefaulteAddress(AccessToken : String , selectedAddressId: String){
        ApolloNetwokService.shared.apollo.perform(mutation: DefaultAddressUpdateMutation(customerAccessToken: AccessToken, id: selectedAddressId)){result in
            switch result {
            case .success(let graphQlResult):
               print("success")
                if let result = graphQlResult.data?.customerDefaultAddressUpdate?.customer?.defaultAddress{
                    let tempAddress = Address(id: result.id, address1: result.address1, address2: result.address2, name: result.name, phone: result.phone, city: result.city, company: result.company, country: result.country,  firstName: result.firstName, lastName: result.lastName, zip: result.zip)
                    self.addressPackage.defaultAddress = tempAddress
                    
                }
                self.addressPackage.success = true
            case .failure(let error):
                self.addressPackage.success = false
                self.addressPackage.messages = [error.localizedDescription]
                print("failed")
            }
            
        }
    }
    func deleteAddress(AccessToken : String , selectedAddressId: String){
        ApolloNetwokService.shared.apollo.perform(mutation: DeleteAddressMutation(customerAccessToken: AccessToken, id: selectedAddressId)){result in
            switch result {
            case .success(let graphQlResult):
                if let result = graphQlResult.data?.customerAddressDelete?.deletedCustomerAddressId{
                    self.addressPackage.listOfAddress.removeAll { Address in
                        return Address.id == result
                    }
                }
               print("success")
                self.addressPackage.success = true
            case .failure(let error):
                self.addressPackage.success = false
                self.addressPackage.messages = [error.localizedDescription]
                print("failed")
            }
            
        }
    }
    func createAddresses(AccessToken: String ,selectedAddress: Address){
        ApolloNetwokService.shared.apollo.perform(mutation: AddressCreateMutation(customerAccessToken: AccessToken, zip: selectedAddress.zip ?? " ", phone: selectedAddress.phone ?? " ", firstName: selectedAddress.firstName ?? "", lastName: selectedAddress.lastName ?? "", country: selectedAddress.country ?? "", city: selectedAddress.city ?? "", address1: selectedAddress.address1 ?? "", address2: selectedAddress.address2 ?? "")){result in
            switch result {
            case .success(let graphQlResult):
               print("success")
                if let result = graphQlResult.data?.customerAddressCreate?.customerAddress{
                    let tempAddress = Address(id: result.id, address1: result.address1, address2: result.address2,  phone: result.phone, city: result.city, country: result.country,  firstName: result.firstName, lastName: result.lastName, zip: result.zip)
                    self.addressPackage.listOfAddress.append(tempAddress)
                }
                self.addressPackage.success = true
            case .failure(let error):
                self.addressPackage.success = false
                self.addressPackage.messages = [error.localizedDescription]
                print(error.localizedDescription)
            }
            
        }
    }

}
