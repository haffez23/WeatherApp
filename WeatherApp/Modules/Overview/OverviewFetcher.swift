    //
    //  WeatherFetcher.swift
    //  WeatherApp
    //
    //  Created by Mohamed Haffez on 02/02/2024.
    //

import Foundation


protocol WeatherFetchable {
    func fetch()
}

final class WeatherFetcher: WeatherFetchable {
    private let weatherLocalDataFetcher:WeatherLocalDataFetchable
    private let weatherRemoteDataFetcher:WeatherRemoteDataFetchable
    private let networkReachability:NetworkReachabilityListenable?
    private let overviewPresenter:OverviewPresentable
    init(
        weatherLocalDataFetcher:WeatherLocalDataFetchable,
        weatherRemoteDataFetcher:WeatherRemoteDataFetchable,
        networkReachability:NetworkReachabilityListenable?,
        overviewPresenter:OverviewPresentable
    ) {
        self.weatherLocalDataFetcher = weatherLocalDataFetcher
        self.weatherRemoteDataFetcher = weatherRemoteDataFetcher
        self.networkReachability = networkReachability
        self.overviewPresenter = overviewPresenter
    }
    
    func fetch() {
        guard networkReachability?.isReachable == true else {
            weatherLocalDataFetcher.fetch {[weak self] result in
                switch result {
                    case .success(let overview):
                        self?.overviewPresenter.present(overview: overview)
                    case .failure(let failure):
                        print("failure")
                }
            }
            return
        }
        weatherRemoteDataFetcher.fetch {[weak self] result in
            switch result {
                case .success(let overview):
                    self?.weatherLocalDataFetcher.save(data: overview)
                    self?.overviewPresenter.present(overview: overview)
                    print("Success")
                case .failure(let error):
                    print("Fail to load weather overview \(error)")
            }
            
        }
    }
}
