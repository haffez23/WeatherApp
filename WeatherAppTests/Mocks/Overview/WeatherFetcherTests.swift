//
//  WeatherFetcherTests.swift
//  WeatherAppTests
//
//  Created by Mohamed Haffez on 03/02/2024.
//

import Foundation
@testable import WeatherApp
import Quick
import Nimble

class WeatherFetcherTests: QuickSpec {
    override class func spec() {
        describe("WeatherFetcher") {
            let presenter = OverviewPresenterMock()
            
            let weatherFetcher = WeatherFetcher(
                weatherLocalDataFetcher: WeatherLocalDataFetcherMock(),
                weatherRemoteDataFetcher: WeatherRemoteDataFetcherMock(),
                networkReachability: NetworkReachabilityMock(),
                overviewPresenter: presenter
            )
            
            weatherFetcher.fetch()
            expect(presenter.invokedPresentCount).to(equal(1))
            
        }
    }
}
