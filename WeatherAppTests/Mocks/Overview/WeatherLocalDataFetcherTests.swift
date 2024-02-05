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
        var weatherLocalDataStore : WeatherLocalDataStoreMock!
        var  weatherLocalDataFetcher : WeatherLocalDataFetcher!
        
//        describe("WeatherLocalDataFetcher"){
//            beforeEach {
//                weatherLocalDataStore = WeatherLocalDataStoreMock()
//                
//                weatherLocalDataFetcher = WeatherLocalDataFetcher(
//                    store: weatherLocalDataStore
//                )
//            }
//            
//            context("Fetch data from local store"){
//                let mockHeadline = Headline(
//                    effectiveDate: Date(),effectiveEpochDate: 0, severity: 0,
//                    text: "", category: "", endDate: Date(), endEpochDate: 0,
//                    mobileLink: "", link: ""
//                )
//                weatherLocalDataStore.resultData = Overview(
//                    headline: mockHeadline,
//                    dailyForecasts: []
//                )
//
//                waitUntil { done in
//                    
//                    weatherLocalDataFetcher.fetch { result  in
//                        expect(weatherLocalDataStore.invokedFetchCount).to(equal(1))
//                        done()
//                    }
//                }
//            }
//            
//            context("Save data to local store"){
//                let mockHeadline = Headline(
//                    effectiveDate: Date(),effectiveEpochDate: 0, severity: 0,
//                    text: "", category: "", endDate: Date(), endEpochDate: 0,
//                    mobileLink: "", link: ""
//                )
//                weatherLocalDataFetcher.save(data: Overview(headline: mockHeadline, dailyForecasts: []))
//                expect(weatherLocalDataStore.invokedFetchCount).to(equal(1))
//            }
//        }
    }
}
