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

    override class func spec() {
        var weatherLocalDataStore : WeatherLocalDataStoreMock!
        var  weatherLocalDataFetcher : WeatherLocalDataFetcher!
        
        beforeEach {
            weatherLocalDataStore = WeatherLocalDataStoreMock()
            
            weatherLocalDataFetcher = WeatherLocalDataFetcher(
                store: weatherLocalDataStore
            )
        }
        
        context("Fetch data from local store"){
            weatherLocalDataFetcher.fetch { result  in }
            expect(weatherLocalDataStore.invokedFetchCount).to(equal(1))
        }
        
        context("Save data to local store"){
            weatherLocalDataFetcher.save(data: Overview(id: "1"))
            expect(weatherLocalDataStore.invokedFetchCount).to(equal(1))
        }
    }
}
