//
//  OverviewController.swift
//  WeatherAppTests
//
//  Created by Mohamed Haffez on 03/02/2024.
//

import Foundation
import Nimble
import Quick
@testable import WeatherApp

class OverviewControllerTests: QuickSpec {
    override class func spec() {
        describe("OverviewController") {
            let weatherFetcher = WeatherFetcherMock()
            let reachabilityStarter = NetworkReachabilityStarterMock()
            let controller = OverviewController(
                weatherFetcher: weatherFetcher,
                reachabilityStarter: reachabilityStarter
            )
            
            controller.didLoadViews()
            expect(reachabilityStarter.invokedStartMonitoringCount).to(equal(1))
            expect(weatherFetcher.invokedFetchCount).to(equal(1))
        }
    }
}
