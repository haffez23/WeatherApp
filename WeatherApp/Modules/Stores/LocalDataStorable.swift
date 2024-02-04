//
//  LocalDataStorable.swift
//  WeatherApp
//
//  Created by Mohamed Haffez on 04/02/2024.
//

import Foundation
protocol OverviewLocalDataStorable {
    func fetch(completion:@escaping (Result<Overview, Error>) -> Void)
    func set(data:Overview)
}
