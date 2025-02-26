//
//  RegisterService.swift
//  M-Commerce-App
//
//  Created by Zeiad on 16/02/2025.
//

import Foundation
import ShopifyAPIKit

protocol AuthServiceProtocol {
    static func registerCustomer(
        firstName: String,
        lastName: String,
        email: String,
        phone: String,
        password: String,
        acceptsMarketing: Bool,
        complitionHandler: @escaping (RegisterResponse) -> Void)
    static func loginCustomer(
        email: String,
        password: String,
        complitionHandler: @escaping (LoginResponse) -> Void)
    
    static func logOutCustomer(
        customerAccessToken: String,
        complitionHandler: @escaping (LogOutResponse) -> Void)
    
    static func getCustomerData(
        accessToken: String,
        accessTokenExpiresAt: String?,
        complitionHandler: @escaping (LoginResponse) -> Void
    )
    static func updateProfile(
        customerAccessToken: String,
        accessTokenExpiresAt: String,
        firstName: String,
        lastName: String,
        email: String,
        phone: String,
        password: String?,
        acceptsMarketing: Bool?,
        complitionHandler: @escaping (UpdateProfileResponse) -> Void
    )
}

class AuthService: AuthServiceProtocol {
    
    
    static func registerCustomer(
        firstName: String,
        lastName: String,
        email: String,
        phone: String,
        password: String,
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
                let userErrors = graphQLResult.data?.customerCreate?
                    .customerUserErrors.map { $0.message }
                let requestError = graphQLResult.errors?.first?.message
                guard let customerDTO else {
                    complitionHandler(
                        RegisterResponse(
                            success: false,
                            messages: userErrors ?? [requestError ?? ""]
                        )
                    )
                    return
                }
                let customer = RegisterMutation.parse(from: customerDTO)
                complitionHandler(
                    RegisterResponse(
                        applicationUser: customer,
                        success: true,
                        messages: userErrors ?? [requestError ?? ""]
                    ))
            case .failure(let error):
                complitionHandler(
                    RegisterResponse(
                        success: false,
                        messages: [error.localizedDescription]
                    )
                )
                print("Failure! Error: \(error.localizedDescription)")
            }
        }
    }
    static func loginCustomer(
        email: String,
        password: String,
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
    static func logOutCustomer(customerAccessToken: String, complitionHandler: @escaping (LogOutResponse) -> Void) {
        ApolloNetwokService.shared.apollo.perform(
            mutation: LogoutMutation(
                customerAccessToken: customerAccessToken
            )
        ) { result in
            switch result {
            case .success(let graphQLResult):
                let loginDTO = graphQLResult.data?.customerAccessTokenDelete?
                    .deletedAccessToken
                let userErrors = graphQLResult.data?.customerAccessTokenDelete?
                    .userErrors.map { $0.message }
                let requestError = graphQLResult.errors?.first?.message
                guard let loginDTO else {
                    complitionHandler(
                        LogOutResponse(
                            success: false,
                            messages: userErrors ?? [requestError ?? ""]
                        )
                    )
                    return
                }

                complitionHandler(
                    LogOutResponse(
                        success: true,
                        messages: userErrors ?? [requestError ?? ""]
                    )
                )
                return

            case .failure(let error):
                complitionHandler(
                    LogOutResponse(
                        success: false,
                        messages: [error.localizedDescription]
                    )
                )
                print("Failure! Error: \(error.localizedDescription)")
            }
        }
    }
    static func getCustomerData(
        accessToken: String,
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

    static func updateProfile(
        customerAccessToken: String,
        accessTokenExpiresAt: String,
        firstName: String,
        lastName: String,
        email: String,
        phone: String,
        password: String?,
        acceptsMarketing: Bool?,
        complitionHandler: @escaping (UpdateProfileResponse) -> Void
    ) {
        ApolloNetwokService.shared.apollo.perform(
            mutation: UpdateProfileMutation(
                customerAccessToken: customerAccessToken,
                firstName: GraphQLNullable<String>.some(firstName),
                lastName: GraphQLNullable<String>.some(lastName),
                email: GraphQLNullable<String>.some(email),
                phone: GraphQLNullable<String>.some(phone),
                password: password != nil
                    ? GraphQLNullable<String>.some(password!) : nil,
                acceptsMarketing: acceptsMarketing != nil
                    ? GraphQLNullable<Bool>.some(acceptsMarketing!) : nil
            )
        ) { result in
            switch result {
            case .success(let graphQLResult):
                let customerDTO = graphQLResult.data?.customerUpdate?.customer
                let userErrors = graphQLResult.data?.customerUpdate?
                    .customerUserErrors.map { $0.message }
                let requestError = graphQLResult.errors?.first?.message
                guard let customerDTO else {
                    complitionHandler(
                        UpdateProfileResponse(
                            success: false,
                            messages: userErrors ?? [requestError ?? ""]
                        )
                    )
                    return
                }

                let customer = UpdateProfileMutation.parse(
                    from: customerDTO, accessToken: customerAccessToken,
                    accessTokenExpiresAt: accessTokenExpiresAt)
                complitionHandler(
                    UpdateProfileResponse(
                        applicationUser: customer,
                        success: true,
                        messages: userErrors ?? [requestError ?? ""]
                    ))
            case .failure(let error):
                complitionHandler(
                    UpdateProfileResponse(
                        success: false,
                        messages: [error.localizedDescription]
                    )
                )
                print("Failure! Error: \(error.localizedDescription)")
            }
        }
    }
}
