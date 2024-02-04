//
//  WeatherLocalDataStore.swift
//  WeatherApp
//
//  Created by Mohamed Haffez on 04/02/2024.
//

import Foundation

class WeatherLocalDataStore: LocalDataStorable {
    
    var data:Any? = nil
    
    func fetch(completion:@escaping (Any) -> Void) {
        guard let data else {return}
        completion(data)
    }
    
    func set(data:Any) {
        self.data = data
    }
}
