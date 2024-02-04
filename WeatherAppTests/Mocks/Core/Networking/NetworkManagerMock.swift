    //
    //  NetworkManagerTests.swift
    //  WeatherAppTests
    //
    //  Created by Mohamed Haffez on 04/02/2024.
    //

import Foundation
@testable import WeatherApp

class NetworkManagerMock: NetworkManagerExectable{
    
    
    var invokedExecute = false
    var invokedExecuteCount = 0
    var invokedExecuteDataResult: Data?
    
    var errorData: ErrorMock?
    var invokedExecuteWithErrorData:Data?
    
    func execute<T>(
        _ request: NetworkRequest,
        deserializer: @escaping (Data, [AnyHashable : Any]) throws -> T,
        success: @escaping (T) -> Void,
        failure: @escaping (Error) -> Void,
        errorDeserializer: ((Data, Error) throws -> Error)?) where T : Decodable {
            invokedExecuteCount += 1
            if let errorData{
                failure(errorData)
            }else if let invokedExecuteWithErrorData, let errorDeserializer{
                failure(try! errorDeserializer(invokedExecuteWithErrorData, ErrorMock()))
            }else {
                success(invokedExecuteDataResult as! T)
            }
        }
}
