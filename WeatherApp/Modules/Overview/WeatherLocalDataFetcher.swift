//
//  WeatherLocalDataFetcher.swift
//  WeatherApp
//
//  Created by Mohamed Haffez on 04/02/2024.
//

import Foundation

protocol WeatherLocalDataFetchable {
    func fetch(completion:@escaping (Result<Overview, Error>) -> Void)
    func save(data:Overview)
}


final class WeatherLocalDataFetcher: WeatherLocalDataFetchable {
    var store:OverviewLocalDataStorable
    init(store:OverviewLocalDataStorable) {
        self.store = store
    }
    
    func fetch(completion:@escaping (Result<Overview, Error>) -> Void) {
        store.fetch(completion: completion)
    }
    
    func save(data:Overview) {
        store.set(data: data)
    }
}
