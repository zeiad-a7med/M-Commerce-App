//
//  RegisterService.swift
//  M-Commerce-App
//
//  Created by Zeiad on 16/02/2025.
//

import Foundation
import ShopifyAPIKit

protocol LoginServiceProtocol {
    static func loginCustomer(
        email: String!,
        password: String!,
        complitionHandler: @escaping (LoginResponse) -> Void)
    static func getCustomerData(
        accessToken: String!,
        accessTokenExpiresAt: String?,
        complitionHandler: @escaping (LoginResponse) -> Void
    )
}

class LoginService: LoginServiceProtocol {
    static func loginCustomer(
        email: String!,
        password: String!,
        complitionHandler: @escaping (LoginResponse) -> Void
    ) {
        ApolloNetwokService.shared.apollo.perform(
            mutation: LoginMutation(
                email: email,
                password: password
            )
        ) { result in
            switch result {
            case .success(let graphQLResult):
                let loginDTO = graphQLResult.data?.customerAccessTokenCreate?
                    .customerAccessToken
                let userErrors = graphQLResult.data?.customerAccessTokenCreate?
                    .customerUserErrors.map { $0.message }
                let requestError = graphQLResult.errors?.first?.message
                guard let loginDTO else {
                    complitionHandler(
                        LoginResponse(
                            success: false,
                            messages: userErrors ?? [requestError ?? ""]
                        )
                    )
                    return
                }

                getCustomerData(
                    accessToken: loginDTO.accessToken,
                    accessTokenExpiresAt: loginDTO.expiresAt
                ) { result in
                    complitionHandler(
                        result
                    )
                }

            case .failure(let error):
                complitionHandler(
                    LoginResponse(
                        success: false,
                        messages: [error.localizedDescription]
                    )
                )
                print("Failure! Error: \(error.localizedDescription)")
            }
        }
    }
    static func getCustomerData(
        accessToken: String!,
        accessTokenExpiresAt: String?,
        complitionHandler: @escaping (LoginResponse) -> Void
    ) {
        ApolloNetwokService.shared.apollo.fetch(
            query: ProfileQuery(
                customerAccessToken: accessToken
            )
        ) { result in
            switch result {
            case .success(let graphQLResult):
                let customerDTO = graphQLResult.data?.customer
                let requestError = graphQLResult.errors?.first?.message
                guard let customerDTO else {

                    complitionHandler(
                        LoginResponse(
                            success: false,
                            messages: [requestError ?? ""]
                        )
                    )
                    return
                }
                let customer = ProfileQuery.parse(
                    from: customerDTO, accessToken: accessToken,
                    accessTokenExpiresAt: accessTokenExpiresAt)
                complitionHandler(
                    LoginResponse(
                        applicationUser: customer,
                        success: true,
                        messages: [requestError ?? ""]
                    )
                )
            case .failure(let error):
                complitionHandler(
                    LoginResponse(
                        success: false,
                        messages: [error.localizedDescription]
                    )
                )
                print("Failure! Error: \(error.localizedDescription)")
            }
        }
    }
}
