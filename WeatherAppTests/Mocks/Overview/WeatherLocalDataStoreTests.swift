//
//  WeatherLocalDataStoreTests.swift
//  WeatherAppTests
//
//  Created by Mohamed Haffez on 05/02/2024.
//

import Foundation
import Nimble
import Quick
@testable import WeatherApp

class WeatherLocalDataStoreTests: QuickSpec {
    override func spec() {
        describe("WeatherLocalDataStore") {
            var weatherLocalDataStore: WeatherLocalDataStore!
            var cache:  CachableMock = CachableMock()
            
            context("Fetch data from local store") {
                beforeEach {
                    weatherLocalDataStore = WeatherLocalDataStore(cache: cache)
                }
                
                it("and should return cached data"){
                    cache.subbedGetCacheItem = CacheItem(value: OverviewMock.make(), expiresAt: Date().addingTimeInterval(60*60))
                    waitUntil { done in
                        weatherLocalDataStore.fetch { result in
                            expect(cache.invokedGetCacheItem).to(beTrue())
                            expect(result).to(beSuccess())
                            done()
                        }
                    }
                }
                
                it("and should return error on expired cache"){
                    cache.subbedGetCacheItem = CacheItem(value: OverviewMock.make(), expiresAt: Date().addingTimeInterval(-60*60))
                    waitUntil { done in
                        weatherLocalDataStore.fetch { result in
                            expect(cache.invokedGetCacheItem).to(beTrue())
                            expect(result).to(beFailure())
                            done()
                        }
                    }
                }
                
                it("and should return error on empty cache"){
                    cache.subbedGetCacheItem = nil
                    waitUntil { done in
                        weatherLocalDataStore.fetch { result in
                            expect(cache.invokedGetCacheItem).to(beTrue())
                            expect(result).to(beFailure())
                            done()
                        }
                    }
                    
                }
            }
            
            context("Save data to local store") {
                beforeEach {
                    weatherLocalDataStore = WeatherLocalDataStore(cache: cache)
                }
                
                it("should save data"){
                    waitUntil { done in
                        weatherLocalDataStore.set(data: OverviewMock.make())
                        expect(cache.invokedSetCacheItem).to(beTrue())
                        done()
                    }
                }
            }
        }
    }
}
