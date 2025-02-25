//
//  FavoritesManager.swift
//  M-Commerce-App
//
//  Created by Zeiad on 15/02/2025.
//

import Foundation
import SwiftData
import SwiftUI

class NavigationManager: ObservableObject {
    static let shared = NavigationManager()  // Singleton instance
    @Published var path = NavigationPath()
    @Published var tab = 0

    private init() {}  // Private initializer to enforce singleton pattern

    func push(_ target: RouteTypes) {
        switch target {
        case .home:
            popToRoot()
            tab = 0
        case .categories:
            popToRoot()
            tab = 1
        case .settings:
            popToRoot()
            tab = 2
        case .orders:
            popToRoot()
            tab = 3

        default:
            path.append(target)
        }

    }
    func pushReplacement(_ target: RouteTypes) {
        path.removeLast()
        path.append(target)
    }
    func pop() {
        path.removeLast()
    }
    func popWithSize(_ size: Int) {
        path.removeLast(size)
    }
    func popToRoot() {
        path.removeLast(path.count)
    }
    func manageDestination(_ target: RouteTypes) -> AnyView {
        switch target {
        //MainNavBTN
        case .cart:
            return AnyView(ShoppingView())
        case .favorites:
            return AnyView(FavoritesView())

        //subScreens
        case .brand(let title):
            return AnyView(ProductsView(brandTitle: title))
        case .product(let id):
            return AnyView(ProductInfoView(productId: id))
        case .payment:
            return AnyView(PaymentView())
        case .orderDetails(let orderId):
            return AnyView(DetailsView(orderId: orderId))
        case .productInfo(let productId):
            return AnyView(ProductInfoView(productId: productId))
        case .addresses:
            return AnyView(AddressesDisplayView())
        case .addressEdit(let address, let defaultAddress):
            return AnyView(AddressEditView(address: address, defaultAddress: defaultAddress))
        case .addressAdd:
            return AnyView(AddressAddView())
            
            
            
            
        //Auth
        case .login:
            return AnyView(LoginView())
        case .register:
            return AnyView(RegisterView())
        case .editProfile:
            return AnyView(EditProfile())
        case .sendingVerification(let email):
            return AnyView(SendingVerificationView(email: email))

        default:
            return AnyView(EmptyView())
        }
    }
}

enum RouteTypes: Hashable {
    //MainTabs
    case home
    case categories
    case orders
    case settings

    //MainNavBTN
    case favorites
    case cart

    //subScreens
    case brand(title: String)
    case product(id: String)
    case payment
    case orderDetails(orderId: String)
    case productInfo(productId: String)
    case addresses
    case addressEdit(address: Address, defaultAddress: Address?)
    case addressAdd


    //Auth
    case login
    case register
    case editProfile
    case sendingVerification(email: String)

}
