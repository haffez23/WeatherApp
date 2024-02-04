//
//  NetworkReachabilityStarterMock.swift
//  WeatherAppTests
//
//  Created by Mohamed Haffez on 03/02/2024.
//

import Foundation
@testable import WeatherApp
class NetworkReachabilityStarterMock: NetworkReachabilityStarter{
    var invokedStartMonitoringCount = 0
    var invokedStartMonitoring = false
    
    func startMonitoring() {
        invokedStartMonitoring = true
        invokedStartMonitoringCount += 1
    }
}
