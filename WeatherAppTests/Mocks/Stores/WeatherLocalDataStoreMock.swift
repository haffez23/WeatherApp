//
//  WeatherLocalDataStoreMock.swift
//  WeatherAppTests
//
//  Created by Mohamed Haffez on 04/02/2024.
//

import Foundation
@testable import WeatherApp
class WeatherLocalDataStoreMock: OverviewLocalDataStorable{
    
    var errorData:ErrorMock?
    var resultData:Overview?
    
    var invokedFetchCount = 0
    var invokedSetCount = 0

    func fetch(completion: @escaping (Result<Overview, Error>) -> Void) {
        invokedFetchCount += 1
        if let errorData{
            completion(.failure(errorData))
        }else if let resultData{
            completion(.success(resultData))
        }else{
            completion(.failure(ErrorMock()))
        }
    }
    
    func set(data: Overview) {
        invokedSetCount += 1
    }

}
