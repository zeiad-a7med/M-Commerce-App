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

        //Auth
        case .login:
            return AnyView(LoginView())
        case .register:
            return AnyView(RegisterView())

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

    //Auth
    case login
    case register

}
