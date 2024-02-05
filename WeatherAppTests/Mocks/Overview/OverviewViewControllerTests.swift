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
    override func spec() {
        describe("OverviewViewController") {
            it("should call didLoadViews") {
                let didLoadController = ViewDidLoadControllableMock()
                let vc = OverviewViewController(
                    didLoadController: didLoadController,
                    didToggleController: ViewDidToggleControllableMock()
                )
                vc.viewDidLoad()
                expect(didLoadController.invokedDidLoadViews).to(beTrue())
            }
            it("should call didToggle on switch appearance") {
                let didToggleController = ViewDidToggleControllableMock()
                let vc = OverviewViewController(
                    didLoadController: ViewDidLoadControllableMock(),
                    didToggleController: didToggleController)
                vc.viewDidLoad()
                vc.toggleDarkMode(vc.modeSwitch)
                expect(didToggleController.invokedToggle).to(beTrue())
            }
        }
    }
}
