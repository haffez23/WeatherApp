//
//  WeatherFetcherMock.swift
//  WeatherAppTests
//
//  Created by Mohamed Haffez on 03/02/2024.
//

import Foundation
@testable import WeatherApp

class WeatherFetcherMock: WeatherFetchable {
    var invokedFetch = false
    var invokedFetchCount = 0
    
    func fetch() {
        invokedFetch = true
        invokedFetchCount += 1
    }
}
