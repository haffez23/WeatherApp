//
//  LocalDataStorable.swift
//  WeatherApp
//
//  Created by Mohamed Haffez on 04/02/2024.
//

import Foundation
protocol LocalDataStorable {
    func fetch(completion:@escaping (Any) -> Void)
    func set(data:Any)
}
