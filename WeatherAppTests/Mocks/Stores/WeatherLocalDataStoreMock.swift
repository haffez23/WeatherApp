//
//  WeatherLocalDataStoreMock.swift
//  WeatherAppTests
//
//  Created by Mohamed Haffez on 04/02/2024.
//

import Foundation
@testable import WeatherApp
class WeatherLocalDataStoreMock: OverviewLocalDataStorable{
    
    var invokedFetchCount = 0
    var invokedSetCount = 0

    func fetch(completion: @escaping (Result<WeatherApp.Overview, Error>) -> Void) {
        invokedFetchCount += 1
        
    }
    
    func set(data: Overview) {
        invokedSetCount += 1
    }

}
