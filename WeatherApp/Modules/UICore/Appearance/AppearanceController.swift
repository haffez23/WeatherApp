//
//  AppearanceController.swift
//  WeatherApp
//
//  Created by Mohamed Haffez on 05/02/2024.
//

import Foundation

final class AppearanceController: ViewDidToggleControllable {
    private let appearanceSwitcher:AppearanceSwitchable
    var isDark:Bool = false
    init(
        appearanceSwitcher:AppearanceSwitchable
    ) {
        self.appearanceSwitcher = appearanceSwitcher
    }
    
    func didToggle(isOn: Bool) {
        isOn ? appearanceSwitcher.switchToDark() : appearanceSwitcher.switchToLight()
    }
}
