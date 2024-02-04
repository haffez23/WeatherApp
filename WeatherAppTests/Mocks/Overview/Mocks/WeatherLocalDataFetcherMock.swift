//
//  WeatherLocalDataFetcherMock.swift
//  WeatherAppTests
//
//  Created by Mohamed Haffez on 03/02/2024.
//

import Foundation
@testable import WeatherApp

class WeatherLocalDataFetcherMock: WeatherLocalDataFetchable{
    var invokedFetch = false
    var invokedFetchCount = 0
    
    func fetch(completion: @escaping (Any) -> Void) {
        invokedFetch = true
        invokedFetchCount += 1
    }
    
    var invokedSave = false
    var invokedSaveCount = 0
    func save(data: Any) {
        invokedSave = true
        invokedSaveCount += 1
    }
}
