//
//  NetworkReachabilityMock.swift
//  WeatherAppTests
//
//  Created by Mohamed Haffez on 03/02/2024.
//

import Foundation
@testable import WeatherApp

class NetworkReachabilityMock: NetworkReachabilityListenable {
    var invokedIsReachable = false
    var invokedIsReachableCount = 0
    var stubbedIsReachable = true
    
    var isReachable: Bool {
        invokedIsReachable = true
        invokedIsReachableCount += 1
        return stubbedIsReachable
    }
    
    var invokedStartListening = false
    var invokedStartListeningCount = 0
    func startListening(_ completion: @escaping (Bool) -> Void) {
        invokedStartListening = true
        invokedStartListeningCount += 1
        completion(isReachable)
    }
    
    var invokedStopListening = false
    var invokedStopListeningCount = 0
    func stopListening() {
        invokedStopListening = true
        invokedStopListeningCount += 1
    }
}
