//
//  ViewDidToggleControllableMock.swift
//  WeatherAppTests
//
//  Created by Mohamed Haffez on 05/02/2024.
//

import Foundation
@testable import WeatherApp

class ViewDidToggleControllableMock: ViewDidToggleControllable {
    func didToggle(isOn: Bool) {
        invokedToggle = true
        invokedToggleCount += 1
    }
    
    var invokedToggle = false
    var invokedToggleCount = 0
}
