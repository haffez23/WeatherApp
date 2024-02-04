    //
    //  OverviewViewControllerTests.swift
    //  WeatherAppTests
    //
    //  Created by Mohamed Haffez on 03/02/2024.
    //

import Foundation
import Nimble
import Quick
@testable import WeatherApp

final class OverviewViewControllerTests: QuickSpec {
    override class func spec() {
        describe("OverviewViewController") {
            it("should call didLoadViews") {
                let didLoadController = ViewDidLoadControllableMock()
                let vc = OverviewViewController(
                    didLoadController: didLoadController
                )
                vc.viewDidLoad()
                expect(didLoadController.invokedDidLoadViews).to(beTrue())
            }
        }
    }
}
