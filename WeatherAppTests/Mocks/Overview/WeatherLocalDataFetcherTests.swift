//
//  WeatherLocalDataFetcherTests.swift
//  WeatherAppTests
//
//  Created by Mohamed Haffez on 04/02/2024.
//

import Foundation
import Nimble
import Quick
@testable import WeatherApp

class WeatherLocalDataFetcherTests: QuickSpec{

    override func spec() {
        describe("WeatherLocalDataFetcher"){
            var weatherLocalDataStore : WeatherLocalDataStoreMock!
            var  weatherLocalDataFetcher : WeatherLocalDataFetcher!
            context("Fetch data from local store"){
                beforeEach {
                    weatherLocalDataStore = WeatherLocalDataStoreMock()
                    weatherLocalDataFetcher = WeatherLocalDataFetcher(
                        store: weatherLocalDataStore
                    )
                    
                }
                
                it("should return data from store"){
                    weatherLocalDataStore.resultData = OverviewMock.make()
                    waitUntil { done in
                        weatherLocalDataFetcher.fetch { result  in
                            expect(result).to(beSuccess())
                            expect(weatherLocalDataStore.invokedFetchCount).to(equal(1))
                            done()
                        }
                    }
                }
                it("and return error"){
                    weatherLocalDataStore.errorData = ErrorMock()
                    weatherLocalDataStore.resultData = nil
                    waitUntil { done in
                        weatherLocalDataFetcher.fetch { result in
                            expect(result).to(beFailure())
                            expect(weatherLocalDataStore.invokedFetchCount).to(equal(1))
                            done()
                        }
                    }
                }
            }
            
            context("Save data to local store"){
                beforeEach {
                    weatherLocalDataStore = WeatherLocalDataStoreMock()
                    weatherLocalDataFetcher = WeatherLocalDataFetcher(
                        store: weatherLocalDataStore
                    )
                }
                it("should save data"){
                    weatherLocalDataFetcher.save(data: OverviewMock.make())
                    expect(weatherLocalDataStore.invokedSetCount).to(equal(1))
                }
            }
        }
    }
}
