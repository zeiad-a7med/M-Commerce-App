//
//  RegisterService.swift
//  M-Commerce-App
//
//  Created by Zeiad on 16/02/2025.
//

import Foundation
import ShopifyAPIKit

protocol RegisterServiceProtocol {
    static func registerCustomer(
        firstName: String,
        lastName: String,
        email: String!,
        phone: String,
        password: String!,
        acceptsMarketing: Bool,
        complitionHandler: @escaping (RegisterResponse) -> Void)
}

class RegisterService: RegisterServiceProtocol {
    static func registerCustomer(
        firstName: String,
        lastName: String,
        email: String!,
        phone: String,
        password: String!,
        acceptsMarketing: Bool,
        complitionHandler: @escaping (RegisterResponse) -> Void
    ) {
        ApolloNetwokService.shared.apollo.perform(
            mutation: RegisterMutation(
                firstName: GraphQLNullable<String>.some(firstName),
                lastName: GraphQLNullable<String>.some(lastName),
                email: email,
                phone: GraphQLNullable<String>.some(phone),
                password: password,
                acceptsMarketing: GraphQLNullable<Bool>.some(acceptsMarketing)
            )
        ) { result in
            switch result {
            case .success(let graphQLResult):
                let customerDTO = graphQLResult.data?.customerCreate?.customer
                let userErrors = graphQLResult.data?.customerCreate?.customerUserErrors.map{$0.message}
                let requestError = graphQLResult.errors?.first?.message
                guard let customerDTO else {
                    complitionHandler(
                        RegisterResponse(
                            success: false,
                            messages:userErrors ?? [requestError ?? ""]
                        )
                    )
                    return
                }
                let customer = RegisterMutation.parse(from: customerDTO)
                complitionHandler(
                    RegisterResponse(
                        applicationUser: customer,
                        success: true,
                        messages:userErrors ?? [requestError ?? ""]
                    ))
            case .failure(let error):
                complitionHandler(
                    RegisterResponse(
                        success: false,
                        messages:[error.localizedDescription]
                    )
                )
                print("Failure! Error: \(error.localizedDescription)")
            }
        }
    }
}
