    //
    //  WeatherRemoteDataFetcherTests.swift
    //  WeatherAppTests
    //
    //  Created by Mohamed Haffez on 04/02/2024.
    //

import Foundation
import Quick
import Nimble
@testable import WeatherApp

class WeatherRemoteDataFetcherTests: QuickSpec{
    
    override class func spec() {
        var networkManager = NetworkManagerMock()
        var  weatherRemoteDataFetcher : WeatherRemoteDataFetcher!
        
        beforeEach {
            weatherRemoteDataFetcher = WeatherRemoteDataFetcher(
                networkManager: networkManager
            )
        }
        
        context("Execute Fetch data from api"){
            
            beforeEach {
                let overview = Overview(id: "1")
                networkManager.invokedExecuteDataResult = try! JSONEncoder().encode(overview)
                networkManager.invokedExecuteWithErrorData = nil
            }
            
            it("should trigger execute"){
                waitUntil { done in
                    weatherRemoteDataFetcher.fetch { _, _ in
                        expect(networkManager.invokedExecuteCount).to(equal(1))
                        done()
                    }
                }
            }
            
            it("and return success with data"){
                waitUntil { done in
                    weatherRemoteDataFetcher.fetch { overview, error in
                        expect(error).to(beNil())
                        expect(overview).toNot(beNil())
                        expect(overview?.id).to(equal("1"))
                        done()
                    }
                }
            }
            
            it("and return error"){
                networkManager.errorData = ErrorMock()
                waitUntil { done in
                    weatherRemoteDataFetcher.fetch { overview, error in
                        expect(error).toNot(beNil())
                        expect(overview).to(beNil())
                        done()
                    }
                }
                
            }
        }
    }
}
