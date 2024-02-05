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
    
    override func spec() {
        var networkManager = NetworkManagerMock<Overview>()
        var  weatherRemoteDataFetcher : WeatherRemoteDataFetcher!
        
        beforeEach {
            weatherRemoteDataFetcher = WeatherRemoteDataFetcher(
                networkManager: networkManager
            )
        }
        
        context("Execute Fetch data from api"){
            
            beforeEach {
                
                networkManager.invokedExecuteDataResult = OverviewMock.make()
                networkManager.invokedExecuteWithErrorData = nil
            }
            
            it("should trigger execute"){
                waitUntil { done in
                    weatherRemoteDataFetcher.fetch { result
                        in
                        expect(networkManager.invokedExecuteCount).to(equal(1))
                        done()
                    }
                }
            }
            
            it("and return success with data"){
                waitUntil { done in
                    weatherRemoteDataFetcher.fetch { result in
                        switch result {
                            case .success(let overview):
                                expect(overview).toNot(beNil())
                            case .failure(let failure):
                                print("failed")
                                
                        }
                        done()

                    }
                }
            }
            
            it("and return error"){
                networkManager.errorData = ErrorMock()
                waitUntil { done in
                    weatherRemoteDataFetcher.fetch { result in
                        
                        switch result {
                            case .success(let overview):
                                print("expect fail")
                            case .failure(let failure):
                                expect(failure).toNot(beNil())
                        }
                        done()
                    }
                }
                
            }
        }
    }
}
