//
//  ConfigEnvironment.swift
//  WeatherApp
//
//  Created by Mohamed Haffez on 04/02/2024.
//

import Foundation

enum ConfigEnvironment: Int, CaseIterable {
    case DEV = 0
    case PROD
    
    var plistName: String {
        switch self {
            case .DEV:
                return "DEVConfig"
                
            case .PROD:
                return "PRODConfig"
        }
    }
}

extension ConfigEnvironment {

    static func currentEnvironment() -> ConfigEnvironment {
        #if DEBUG
            return ConfigEnvironment.DEV
        #else
            return ConfigEnvironment.PROD
        #endif
    }
}
