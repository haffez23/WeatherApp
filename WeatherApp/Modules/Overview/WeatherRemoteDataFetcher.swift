//
//  WeatherRemoteDataFetcher.swift
//  WeatherApp
//
//  Created by Mohamed Haffez on 04/02/2024.
//

import Foundation

protocol WeatherRemoteDataFetchable {
    func fetch(completion:@escaping (Any) -> Void)
}

final class WeatherRemoteDataFetcher: WeatherRemoteDataFetchable {
    var networkManager:NetworkManagerExectable
    
    init(networkManager:NetworkManagerExectable) {
        self.networkManager = networkManager
    }
    
    func fetch(completion:@escaping (Any) -> Void) {
        
    }
}
