//
//  NetworkMonitor.swift
//  M-Commerce-App
//
//  Created by Usef on 23/02/2025.
//

import Foundation
import Network

@Observable
final class NetworkMonitor {
    static let shared = NetworkMonitor() // Singleton instance
    
    private let networkMonitor = NWPathMonitor()
    private let workerQueue = DispatchQueue(label: "Monitor")
    var isConnected = false
    
    init() {
        networkMonitor.pathUpdateHandler = { [weak self] path in
            self?.isConnected = path.status == .satisfied
        }
        networkMonitor.start(queue: workerQueue)
    }
}

