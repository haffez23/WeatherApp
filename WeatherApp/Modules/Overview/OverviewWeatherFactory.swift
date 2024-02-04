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
        
        let overviewPresenter = OverviewPresenter(
            view: vc,
            viewModel: OverviewViewModel(
                title: "Weather"
            )
        )
        
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

final class WeatherLocalDataStore: LocalDataStorable {
    
    
    var data:Any? = nil
    
    func fetch(completion:@escaping (Any) -> Void) {
        guard let data else {return}
        completion(data)
    }
    
    func set(data: Any) {
        self.data = data
    }
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

final class WeatherRemoteDataFetcher: WeatherRemoteDataFetchable {
    var networkManager:NetworkManagerExectable
    
    init(networkManager:NetworkManagerExectable) {
        self.networkManager = networkManager
    }
    
    func fetch(completion:@escaping (Any) -> Void) {
   
    }
}
