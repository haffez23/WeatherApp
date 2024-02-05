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
    override func spec() {
        describe("WeatherFetcher") {
            context("Fetch data from api") {
                var presenter: OverviewPresenterMock!
                var weatherFetcher: WeatherFetcher!
                let remoteFetcher = WeatherRemoteDataFetcherMock()
                beforeEach {
                    remoteFetcher.resultData = nil
                    remoteFetcher.errorData = nil
                    presenter = OverviewPresenterMock()
                    weatherFetcher = WeatherFetcher(
                        weatherLocalDataFetcher: WeatherLocalDataFetcherMock(),
                        weatherRemoteDataFetcher: remoteFetcher,
                        networkReachability: NetworkReachabilityMock(),
                        overviewPresenter: presenter
                    )
                }
                
                it("Execute Fetch data from api and call presenter on success") {
                    remoteFetcher.resultData = OverviewMock.make()
                    weatherFetcher.fetch()
                    expect(presenter.invokedPresentCount).to(equal(1))
                }
                
                it("and dont call presenter on error") {
                    remoteFetcher.errorData = ErrorMock()
                    weatherFetcher.fetch()
                    expect(presenter.invokedPresentCount).to(equal(0))
                }
            }
            
            context("Save data to local store"){
                var presenter: OverviewPresenterMock!
                var weatherFetcher: WeatherFetcher!
                var remoteFetcher = WeatherRemoteDataFetcherMock()
                var localFetcher = WeatherLocalDataFetcherMock()
                
                beforeEach {
                    presenter = OverviewPresenterMock()
                    remoteFetcher = WeatherRemoteDataFetcherMock()
                    localFetcher = WeatherLocalDataFetcherMock()
                    weatherFetcher = WeatherFetcher(
                        weatherLocalDataFetcher: localFetcher,
                        weatherRemoteDataFetcher: remoteFetcher,
                        networkReachability: NetworkReachabilityMock(),
                        overviewPresenter: presenter
                    )
                }
                
                it("and Save data to local store on remote fetch success"){
                    remoteFetcher.resultData = OverviewMock.make()
                    remoteFetcher.errorData = nil
                    weatherFetcher.fetch()
                    expect(localFetcher.invokedSaveCount).to(equal(1))
                }
                
                it("and dont call local store on remote fetch error"){
                    remoteFetcher.resultData = nil
                    remoteFetcher.errorData = ErrorMock()
                    weatherFetcher.fetch()
                    expect(localFetcher.invokedSaveCount).to(equal(0))
                }
            }
            
            context("Fetch data from local store on network fail"){
                var presenter: OverviewPresenterMock!
                var weatherFetcher: WeatherFetcher!
                let remoteFetcher = WeatherRemoteDataFetcherMock()
                let localFetcher = WeatherLocalDataFetcherMock()
                let reachability = NetworkReachabilityMock()
                
                
                beforeEach {
                    presenter = OverviewPresenterMock()
                    remoteFetcher.resultData = nil
                    remoteFetcher.errorData = nil
                    reachability.stubbedIsReachable = false
                    weatherFetcher = WeatherFetcher(
                        weatherLocalDataFetcher: localFetcher,
                        weatherRemoteDataFetcher: remoteFetcher,
                        networkReachability: NetworkReachabilityMock(),
                        overviewPresenter: presenter
                    )
                }
                
                it("and call local store on network fail"){
                    remoteFetcher.errorData = ErrorMock()
                    weatherFetcher.fetch()
                    expect(localFetcher.invokedFetchCount).to(equal(0))
                }
                
                it("and call presenter on success"){
                    remoteFetcher.resultData = OverviewMock.make()
                    weatherFetcher.fetch()
                    expect(presenter.invokedPresentCount).to(equal(1))
                }
                
                it("and not call presenter on fail"){
                    remoteFetcher.errorData = ErrorMock()
                    weatherFetcher.fetch()
                    expect(presenter.invokedPresentCount).to(equal(0))
                }
                
            }
            
        }
    }
}
