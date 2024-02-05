//
//  NetworkEnvironment.swift
//  WeatherApp
//
//  Created by Mohamed Haffez on 04/02/2024.
//

import Foundation

struct NetworkEnvironment{
    var host: String
    var headers: [String: String] = [:]
    var apikey:String
    
    func buildUrl(fromPath path: String) -> String {
        return "\(host)\(path)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    }
}

extension NetworkEnvironment: Equatable {
    static var weatherApi: NetworkEnvironment {
        let config = EnvironmentSettings.currentConfig.weatherApi
        return NetworkEnvironment(
            host: config.host,
            headers: config.headers,
            apikey: config.apikey
        )
    }
}
