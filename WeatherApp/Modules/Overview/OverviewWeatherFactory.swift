    //
    //  WeatherFactory.swift
    //  WeatherApp
    //
    //  Created by Mohamed Haffez on 02/02/2024.
    //

import Foundation

class OverviewWeatherFactory {
    private let reachabilityStarter:NetworkReachabilityStarter
    
    init( reachabilityStarter: NetworkReachabilityStarter) {
        self.reachabilityStarter = reachabilityStarter
    }
    
    func make() -> OverviewViewController {
        var vc: OverviewViewController?
        
        let weatherLocalDataFetcher = WeatherLocalDataFetcher(
            store: WeatherLocalDataStore()
        )
        
        let weatherRemoteDataFetcher = WeatherRemoteDataFetcher(
            networkManager: NetworkManagerFactory.make()
        )
        
        let overviewPresenter = OverviewPresenter(view: vc)
        
        let overviewController = OverviewController(
            weatherFetcher: WeatherFetcher(
                weatherLocalDataFetcher: weatherLocalDataFetcher,
                weatherRemoteDataFetcher: weatherRemoteDataFetcher,
                networkReachability: NetworkReachability(),
                overviewPresenter: overviewPresenter
            ),
            reachabilityStarter: reachabilityStarter
        )
        
        vc = OverviewViewController(
            didLoadController: overviewController
        )
        
        return vc!
    }
}
