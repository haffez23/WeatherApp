//
//  WeatherLocalDataStore.swift
//  WeatherApp
//
//  Created by Mohamed Haffez on 04/02/2024.
//

import Foundation

class WeatherLocalDataStore: OverviewLocalDataStorable {
    func fetch(completion: @escaping (Result<Overview, Error>) -> Void) {
        if let data {
            completion(.success(data))
        }else{
            completion(.failure(NSError()))
        }
    }
    
    
    var data:Overview? = nil
    
    func set(data: Overview) {
        self.data = data
    }
}
