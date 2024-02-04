//
//  OverviewViewableMock.swift
//  WeatherAppTests
//
//  Created by Mohamed Haffez on 03/02/2024.
//

import Foundation
@testable import WeatherApp
class OverviewViewableMock: OverviewViewable {
    var invokedDisplay = false
    var invokedDisplayCount = 0
    
    func display(viewModel: OverviewViewModel) {
        invokedDisplay = true
        invokedDisplayCount += 1
    }
}
