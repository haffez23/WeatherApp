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
    private let appearanceSwitcher:AppearanceSwitchable
    init(
        reachabilityStarter: NetworkReachabilityStarter,
        appearanceSwitcher: AppearanceSwitchable)
    {
        self.reachabilityStarter = reachabilityStarter
        self.appearanceSwitcher = appearanceSwitcher
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
            didLoadController: overviewController,
            didToggleController: AppearanceController(
                appearanceSwitcher: appearanceSwitcher
            )
        )
        overviewPresenter.view = vc
        
        return vc!
    }
}
