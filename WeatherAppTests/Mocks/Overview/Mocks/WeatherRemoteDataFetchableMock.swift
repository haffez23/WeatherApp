//
//  Remote.swift
//  WeatherAppTests
//
//  Created by Mohamed Haffez on 03/02/2024.
//

import Foundation
@testable import WeatherApp

class WeatherRemoteDataFetcherMock: WeatherRemoteDataFetchable {
    
    var invokedFetch = false
    var invokedFetchCount = 0
    var stubbedFetch = "stubbedFetch"
    
    func fetch(completion: @escaping (Any) -> Void) {
        invokedFetch = true
        invokedFetchCount += 1
        completion(stubbedFetch)
    }
}
