    //
    //  Remote.swift
    //  WeatherAppTests
    //
    //  Created by Mohamed Haffez on 03/02/2024.
    //

import Foundation
import Nimble
@testable import WeatherApp

class WeatherRemoteDataFetcherMock: WeatherRemoteDataFetchable {
    
    
    var invokedFetch = false
    var invokedFetchCount = 0
    var errorData:Error?
    var resultData: Overview?
    
    func fetch(completion: @escaping (Result<Overview, Error>) -> Void) {
        invokedFetch = true
        invokedFetchCount += 1
        
        if let errorData{
            completion(.failure(errorData))
        }else if let resultData{
            completion(.success(resultData))
        }else{
            completion(.failure(ErrorMock()))
        }
        
    }

}
