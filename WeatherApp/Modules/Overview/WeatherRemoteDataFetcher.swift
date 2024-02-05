    //
    //  WeatherRemoteDataFetcher.swift
    //  WeatherApp
    //
    //  Created by Mohamed Haffez on 04/02/2024.
    //

import Foundation

protocol WeatherRemoteDataFetchable {
    func fetch(completion:@escaping (Result<Overview, Error>) -> Void)
}

final class WeatherRemoteDataFetcher: WeatherRemoteDataFetchable {
    var networkManager:NetworkManagerExectable
    
    init(networkManager:NetworkManagerExectable) {
        self.networkManager = networkManager
    }
    
    func fetch(completion:@escaping (Result<Overview, Error>) -> Void) {
        let request = OverviewRequest()
        request.locationId = "1"
        
        networkManager.execute(
            request,
            success: { (overview: Overview) in completion(.success(overview)) },
            failure: { (error: Error) in completion(.failure(error)) }
        )
    }
}
