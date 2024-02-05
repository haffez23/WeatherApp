//
//  OverviewPresenterTests.swift
//  WeatherAppTests
//
//  Created by Mohamed Haffez on 03/02/2024.
//

import Foundation
import Nimble
import Quick
@testable import WeatherApp

class OverviewPresenterTests: QuickSpec {
    override func spec() {
        describe("OverviewPresenter") {
            let overviewViewableMock = OverviewViewableMock()
            let presenter = OverviewPresenter(
                view: overviewViewableMock
            )
            
            presenter.present(overview: OverviewMock.make())
            expect(overviewViewableMock.invokedDisplayCount).to(equal(1))
        }
    }
}
