    //
    //  WeatherLocalDataStore.swift
    //  WeatherApp
    //
    //  Created by Mohamed Haffez on 04/02/2024.
    //

import Foundation

protocol OverviewLocalDataStorable {
    func fetch(completion:@escaping (Result<Overview, Error>) -> Void)
    func set(data:Overview)
}

class WeatherLocalDataStore: OverviewLocalDataStorable {
    let cache:Cachable
    
    init(cache: Cachable) {
        self.cache = cache
    }
    
    func fetch(completion: @escaping (Result<Overview, Error>) -> Void) {
        if let overview = cache.getCacheItem(
            forKey: "overview",
            deserializer: { data in
                try JSONDecoder().decode(Overview.self, from: data)
            })?.getValue(ofType: Overview.self, at: Date())
        {
            completion(.success(overview))
        }else{
            print("No data")
            completion(.failure(NSError()))
        }
    }
    
    func set(data: Overview) {
        cache.setCacheItem(item: data,
                           forKey: "overview",
                           expirationDate: Date().addingTimeInterval(60*60*24))
    }
}
