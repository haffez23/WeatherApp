//
//  OverviewController.swift
//  WeatherApp
//
//  Created by Mohamed Haffez on 02/02/2024.
//

import Foundation

final class OverviewController: ViewDidLoadControllable {
    private let weatherFetcher:WeatherFetchable
    private let reachabilityStarter:NetworkReachabilityStarter
    
    init(
        weatherFetcher:WeatherFetchable,
        reachabilityStarter:NetworkReachabilityStarter
    ) {
        self.weatherFetcher = weatherFetcher
        self.reachabilityStarter = reachabilityStarter
    }
    
    func didLoadViews() {
        reachabilityStarter.startMonitoring()
        weatherFetcher.fetch()
    }
}
