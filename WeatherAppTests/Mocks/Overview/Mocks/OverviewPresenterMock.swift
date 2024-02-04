//
//  OverviewPresenterMock.swift
//  WeatherAppTests
//
//  Created by Mohamed Haffez on 03/02/2024.
//

import Foundation
@testable import WeatherApp

class OverviewPresenterMock: OverviewPresentable {
    var invokedPresent = false
    var invokedPresentCount = 0
    
    func present(overview: Overview) {
        invokedPresent = true
        invokedPresentCount += 1
    }
}
