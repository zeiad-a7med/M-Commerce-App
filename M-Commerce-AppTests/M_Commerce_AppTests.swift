//
//  M_Commerce_AppTests.swift
//  M-Commerce-AppTests
//
//  Created by Andrew Emad on 12/02/2025.
//

import XCTest
@testable import M_Commerce_App
import ShopifyAPIKit

final class M_Commerce_AppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchCurrencyExchangeRatesFromApi() {
        let myExpectation = expectation(description: "waiting for currency api")
        MoyaNetworkManager.shared.fetchCurrencyExchangeRates { result in
            switch result {
            case .success(let data):
                XCTAssertEqual(data.data?.isEmpty, false, "Expected exchange rates but got empty data.")
                myExpectation.fulfill()
            case .failure(let error):
                XCTFail("error: \(error)")
            }
        }
        waitForExpectations(timeout: 5)
    }

    
    func testgetProductsFromApi() {
        let myExpectation = expectation(description: "waiting for currency api")
        ApolloNetwokService.shared.apollo.fetch(
            query: GetFilteredProductsQuery(
                first: 10, after: nil, query: "men")) { res in
            switch res {
                case .success(let data):
                XCTAssertEqual(data.data?.products.nodes.isEmpty, false)
                myExpectation.fulfill()
            case .failure(let error):
                XCTFail("error: \(error)")
            }
        }
        waitForExpectations(timeout: 5)
    }

    func testgetProductFromApi() {
        let myExpectation = expectation(description: "waiting for currency api")
        ApolloNetwokService.shared.apollo.fetch( query: GetProductQuery(id: ""), cachePolicy: .fetchIgnoringCacheData) { res in
            switch res {
                case .success(let data):
                XCTAssertNotNil(data, "Data should not be nil")
                myExpectation.fulfill()
            case .failure(let error):
                XCTFail("error: \(error)")
            }
        }
        waitForExpectations(timeout: 5)
    }
    
    
//
//    func testfetchCategoriesWithFilter() {
//        ApolloNetwokService.shared.apollo.fetch(
//            query: GetFilteredProductsQuery(
//                first: 10, after: nil, query: "men")) { res in
//            switch res {
//                case .success(let data):
//                XCTAssertEqual(data.data?.products.nodes.isEmpty, false)
//            case .failure(let error):
//                XCTFail("error: \(error)")
//            }
//        }
//    }
}
