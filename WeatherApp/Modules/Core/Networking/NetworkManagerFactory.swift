    //
    //  NetworkManagerFactory.swift
    //  WeatherApp
    //
    //  Created by Mohamed Haffez on 04/07/2023.
    //

import Foundation

final class NetworkManagerFactory {
    
    fileprivate static var networkManager:NetworkManagerExectable!
    
    static func make() -> NetworkManagerExectable {
        if let networkManager = NetworkManagerFactory.networkManager{
            return networkManager
        }
        NetworkManagerFactory.networkManager = NetworkManager(environment: .weatherApi)
        return NetworkManagerFactory.networkManager!
    }
}
