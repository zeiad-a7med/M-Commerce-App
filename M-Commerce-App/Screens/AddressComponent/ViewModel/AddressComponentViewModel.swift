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
    @Published var isLoading : Bool = false
    init(){
        fetchAddresses(
            AccessToken: AuthManager.shared.applicationUser?
                .accessToken ?? " ")
    }
    func fetchAddresses(AccessToken: String){
        isLoading = true
        ApolloNetwokService.shared.apollo.fetch(query: GetCustomerAddressesQuery(customerAccessToken: AccessToken),cachePolicy: .fetchIgnoringCacheData){result in
            self.isLoading = false
            switch result {
            case .success(let graphQlResult):
                if let defaultAddress = graphQlResult.data?.customer?.defaultAddress{
                    self.addressPackage.defaultAddress = Address(id: defaultAddress.id, address1: defaultAddress.address1, address2: defaultAddress.address2, name: defaultAddress.name, phone: defaultAddress.phone, city: defaultAddress.city, company: defaultAddress.company, country: defaultAddress.country,  firstName: defaultAddress.firstName, lastName: defaultAddress.lastName, latitude: defaultAddress.latitude, longitude: defaultAddress.longitude, province: defaultAddress.province, provinceCode: defaultAddress.provinceCode, zip: defaultAddress.zip)
                }
                if let data = graphQlResult.data?.customer?.addresses.nodes{
                    var tempList = [Address]()
                    data.forEach { result in
                        let tempAddress = Address(id: result.id, address1: result.address1, address2: result.address2, name: result.name, phone: result.phone, city: result.city, company: result.company, country: result.country,  firstName: result.firstName, lastName: result.lastName, latitude: result.latitude, longitude: result.longitude, province: result.province, provinceCode: result.provinceCode, zip: result.zip)
                        tempList.append(tempAddress)
                
                    }
                    self.addressPackage.listOfAddress = tempList//updated lateast address
                    self.addressPackage.success=true
                    
                    var user = AuthManager.shared.applicationUser
                    user?.addresses = tempList
                    user?.defaultAddress = self.addressPackage.defaultAddress
                    AuthManager.shared.updateUser(updatedUser: user!)
                    
                }
            case .failure(let error):
                self.addressPackage.success = false
                self.addressPackage.messages = [error.localizedDescription]
            }
            
        }
    }
    func updateAddresses(accessToken: String ,selectedAddress: Address ){
        isLoading = true
        ApolloNetwokService.shared.apollo.perform(mutation: UpdateAddressMutation(customerAccessToken: accessToken, id: selectedAddress.id ?? " ", zip: selectedAddress.zip ?? " ", phone: selectedAddress.phone ?? " ", firstName: selectedAddress.firstName ?? "", lastName: selectedAddress.lastName ?? "", country: selectedAddress.country ?? "", city: selectedAddress.city ?? "", address1: selectedAddress.address1 ?? "", address2: selectedAddress.address2 ?? "")){result in
            self.isLoading = false
            switch result {
            case .success(let graphQlResult):
                if let result = graphQlResult.data?.customerAddressUpdate?.customerAddress{
                    let tempAddress = Address(id: result.id, address1: result.address1, address2: result.address2, name: result.name, phone: result.phone, city: result.city, company: result.company, country: result.country,  firstName: result.firstName, lastName: result.lastName, zip: result.zip)
                   
               
                    if let indexOfTheUpdated = self.addressPackage.listOfAddress.firstIndex(where: {$0.id == selectedAddress.id}){
                        self.addressPackage.listOfAddress[indexOfTheUpdated] = tempAddress
                        print("newAddress = \(self.addressPackage.listOfAddress[indexOfTheUpdated])")
                    }else{
                        for i in self.addressPackage.listOfAddress{
                           // print("ViewModeladdress ID : \(String(describing: i.id))")
                        }
                        print("Selectedaddress ID : \(String(describing: selectedAddress.id))")
                      
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
        isLoading = true
        ApolloNetwokService.shared.apollo.perform(mutation: UpdateDefaultAddressMutation(customerAccessToken: AccessToken, id: selectedAddressId)){result in
            self.isLoading = false
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
        isLoading = true
        ApolloNetwokService.shared.apollo.perform(mutation: DeleteAddressMutation(customerAccessToken: AccessToken, id: selectedAddressId)){result in
            self.isLoading = false
            switch result {
            case .success(let graphQlResult):
                if let result = graphQlResult.data?.customerAddressDelete?.deletedCustomerAddressId{
                    self.fetchAddresses(AccessToken: AuthManager.shared.applicationUser?.accessToken ?? " ")
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
        isLoading = true
        ApolloNetwokService.shared.apollo.perform(mutation: CreateAddressMutation(customerAccessToken: AccessToken, zip: selectedAddress.zip ?? " ", phone: selectedAddress.phone ?? " ", firstName: selectedAddress.firstName ?? "", lastName: selectedAddress.lastName ?? "", country: selectedAddress.country ?? "", city: selectedAddress.city ?? "", address1: selectedAddress.address1 ?? "", address2: selectedAddress.address2 ?? "")){result in
            self.isLoading = false
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
    func checkIfSelectedIsDefaultAddress(selectedAddressId: String, defaultAddressId: String) throws{
        if defaultAddressId == selectedAddressId{
            throw AddressError.addressIsDefault
        }
    }

}
