//
//  WeatherLocalDataFetcher.swift
//  WeatherApp
//
//  Created by Mohamed Haffez on 04/02/2024.
//

import Foundation

protocol WeatherLocalDataFetchable {
    func fetch(completion:@escaping (Any) -> Void)
    func save(data:Any)
}


final class WeatherLocalDataFetcher: WeatherLocalDataFetchable {
    var store:LocalDataStorable
    init(store:LocalDataStorable) {
        self.store = store
    }
    
    func fetch(completion:@escaping (Any) -> Void) {
        store.fetch(completion: completion)
    }
    
    func save(data:Any) {
        store.set(data: data)
    }
}
