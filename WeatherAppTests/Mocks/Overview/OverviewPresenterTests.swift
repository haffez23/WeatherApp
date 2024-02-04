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
    override class func spec() {
        describe("OverviewPresenter") {
            let overviewViewableMock = OverviewViewableMock()
            let presenter = OverviewPresenter(
                view: overviewViewableMock,
                viewModel: OverviewViewModel(title: "test")
            )
            
            presenter.present(overview: "test")
            expect(overviewViewableMock.invokedDisplayCount).to(equal(1))
        }
    }
}
