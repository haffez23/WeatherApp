//
//  ViewDidLoadControllableMock.swift
//  WeatherAppTests
//
//  Created by Mohamed Haffez on 02/02/2024.
//

import Foundation
@testable import WeatherApp

class ViewDidLoadControllableMock: ViewDidLoadControllable {
    var invokedDidLoadViews = false
    
    func didLoadViews() {
        invokedDidLoadViews = true
    }
}
