    //
    //  WeatherFetcher.swift
    //  WeatherApp
    //
    //  Created by Mohamed Haffez on 02/02/2024.
    //

import Foundation

final class WeatherFetcher: WeatherFetchable {
    private let weatherLocalDataFetcher:WeatherLocalDataFetchable
    private let weatherRemoteDataFetcher:WeatherRemoteDataFetchable
    private let networkReachability:NetworkReachabilityListenable
    private let overviewPresenter:OverviewPresentable
    init(
        weatherLocalDataFetcher:WeatherLocalDataFetchable,
        weatherRemoteDataFetcher:WeatherRemoteDataFetchable,
        networkReachability:NetworkReachabilityListenable,
        overviewPresenter:OverviewPresentable
    ) {
        self.weatherLocalDataFetcher = weatherLocalDataFetcher
        self.weatherRemoteDataFetcher = weatherRemoteDataFetcher
        self.networkReachability = networkReachability
        self.overviewPresenter = overviewPresenter
    }
    
    func fetch() {
        guard networkReachability.isReachable else {
            weatherLocalDataFetcher.fetch {[weak self] data in
                self?.overviewPresenter.present(overview: data)
            }
            return
        }
        weatherRemoteDataFetcher.fetch {[weak self] data in
            self?.weatherLocalDataFetcher.save(data: data)
            self?.overviewPresenter.present(overview: data)
        }
    }
}


protocol WeatherFetchable {
    func fetch()
}

protocol WeatherLocalDataFetchable {
    func fetch(completion:@escaping (Any) -> Void)
    func save(data:Any)
}

protocol WeatherRemoteDataFetchable {
    func fetch(completion:@escaping (Any) -> Void)
}

protocol LocalDataStorable {
    func fetch(completion:@escaping (Any) -> Void)
    func set(data:Any)
}
