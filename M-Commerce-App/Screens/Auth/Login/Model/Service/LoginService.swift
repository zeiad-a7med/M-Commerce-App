//
//  RegisterService.swift
//  M-Commerce-App
//
//  Created by Zeiad on 16/02/2025.
//

import Foundation
import ShopifyAPIKit

protocol LoginServiceProtocol {
    static func registerCustomer(
        email: String!,
        password: String!,
        complitionHandler: @escaping (LoginResponse) -> Void)
}

class LoginService: LoginServiceProtocol {
    static func registerCustomer(
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
                let loginDTO = graphQLResult.data?.customerAccessTokenCreate?.customerAccessToken
                let userErrors = graphQLResult.data?.customerAccessTokenCreate?.customerUserErrors.map{$0.message}
                let requestError = graphQLResult.errors?.first?.message
                guard let loginDTO else {
                    complitionHandler(
                        LoginResponse(
                            success: false,
                            messages:userErrors ?? [requestError ?? ""]
                        )
                    )
                    return
                }
                complitionHandler(
                    LoginResponse(
                        accessToken: loginDTO.accessToken,
                        accessTokenExpiresAt: loginDTO.expiresAt,
                        success: true,
                        messages:userErrors ?? [requestError ?? ""]
                    )
                )
            case .failure(let error):
                complitionHandler(
                    LoginResponse(
                        success: false,
                        messages:[error.localizedDescription]
                    )
                )
                print("Failure! Error: \(error.localizedDescription)")
            }
        }
    }
}
