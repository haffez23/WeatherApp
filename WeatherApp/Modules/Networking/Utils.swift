    //
    //  Utils.swift
    //  WeatherApp
    //
    //  Created by Mohamed Haffez on 04/07/2023.
    //

import Foundation
import Alamofire
protocol NetworkRequest {
    
    var path: String {get}
    
    var method: HTTPMethod {get}
    
    var parameters: RequestParams {get}
    
    var headers: [String: String]? {get}
    
}


struct HttpHeaders{
    
    struct keys{
        static let accept = "Accept"
        static let contentType = "Content-Type"
    }
    
    struct Values{
        static let contentType = "Content-Type"
        static let applicationJson = "application/json"
    }
}

enum RequestParams: Equatable {
    
    case body(_ : [String: Any]?)
    case url(_ : [String: Any]?)
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        switch (lhs, rhs) {
            case
                (.url, .body),
                (.body, .url):
                return false
                
            case let (.url(lhsValues), .url(rhsValues)),
                let (.body(lhsValues), .body(rhsValues)):
                guard
                    let lhsValues = lhsValues,
                    let rhsValues = rhsValues else {
                    return lhsValues == nil && rhsValues == nil
                }
                
                return NSDictionary(dictionary: lhsValues).isEqual(to: rhsValues)
        }
    }
}
