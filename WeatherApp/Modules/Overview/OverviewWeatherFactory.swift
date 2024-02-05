    //
    //  WeatherFactory.swift
    //  WeatherApp
    //
    //  Created by Mohamed Haffez on 02/02/2024.
    //

import Foundation
import Alamofire
class OverviewWeatherFactory {
    private let reachabilityStarter:NetworkReachabilityStarter
    init( reachabilityStarter: NetworkReachabilityStarter) {
        self.reachabilityStarter = reachabilityStarter
    }
    
    func make() -> OverviewViewController {
        var vc: OverviewViewController?
        
        let weatherLocalDataFetcher = WeatherLocalDataFetcher(
            store: WeatherLocalDataStore(cache: NetworkPersistedCache())
        )
        
        let weatherRemoteDataFetcher = WeatherRemoteDataFetcher(
            networkManager: NetworkManagerFactory.make()
        )
        
        let overviewPresenter = OverviewPresenter(view: vc)
        
        let overviewController = OverviewController(
            weatherFetcher: WeatherFetcher(
                weatherLocalDataFetcher: weatherLocalDataFetcher,
                weatherRemoteDataFetcher: weatherRemoteDataFetcher,
                networkReachability: NetworkReachabilityManager(),
                overviewPresenter: overviewPresenter
            ),
            reachabilityStarter: reachabilityStarter
        )
        
        vc = OverviewViewController(
            didLoadController: overviewController
        )
        overviewPresenter.view = vc
        
        return vc!
    }
}
