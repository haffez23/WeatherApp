    //
    //  EnvironmentSettings.swift
    //  WeatherApp
    //
    //  Created by Mohamed Haffez on 04/02/2024.
    //

import Foundation

final class EnvironmentSettings {
    private static func plistPathForCurrentConfig(_ env: ConfigEnvironment) -> String? {
        let plistName = env.plistName
        return Bundle.main.path(forResource: plistName, ofType: "plist")
    }
    
    static func getCurrentConfig() -> [String: Any] {
        guard let plistPath = plistPathForCurrentConfig(ConfigEnvironment.currentEnvironment()),
              let plistContent = NSDictionary(contentsOfFile: plistPath) as? [String: Any] else {
            return [:]
        }
        
        return plistContent
    }
    
    static var currentConfig: Config {
        return Config(config: getCurrentConfig())
    }
    
    struct Config {
        private let config: [String: Any]
        
        init(config: [String: Any]) {
            self.config = config
        }
    }
}

extension EnvironmentSettings.Config {
    var weatherApi: ODWeatherApi {
        return ODWeatherApi(
            host: config["baseUrl"] as? String ?? "",
            headers: [:],
            apikey: config["apikey"] as? String ?? ""
        )
    }
    
    struct ODWeatherApi {
        let host: String
        let headers: [String: String]
        let apikey:String
    }
    
}
