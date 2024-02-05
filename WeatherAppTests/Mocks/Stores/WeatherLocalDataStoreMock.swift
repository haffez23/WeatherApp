//
//  WeatherLocalDataStoreMock.swift
//  WeatherAppTests
//
//  Created by Mohamed Haffez on 04/02/2024.
//

import Foundation
@testable import WeatherApp
class WeatherLocalDataStoreMock: OverviewLocalDataStorable{
    
    var errorDate:ErrorMock?
    var resultData:Overview?
    
    var invokedFetchCount = 0
    var invokedSetCount = 0

    func fetch(completion: @escaping (Result<Overview, Error>) -> Void) {
        invokedFetchCount += 1
        if let errorDate{
            completion(.failure(errorDate))
        }else if let resultData{
            completion(.success(resultData))
        }
    }
    
    func set(data: Overview) {
        invokedSetCount += 1
    }

}
