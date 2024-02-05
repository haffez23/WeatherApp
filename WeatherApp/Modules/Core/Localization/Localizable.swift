//
//  Localizable.swift
//  WeatherApp
//
//  Created by Mohamed Haffez on 05/02/2024.
//

import Foundation


public protocol Localizable {
    var localized: String { get }
    func localized(_ args: CVarArg...) -> String
}

public extension Localizable where Self: RawRepresentable, Self.RawValue == String {
    
    var localized: String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
    
    func localized(_ args: CVarArg...) -> String {
        return String(format: self.localized, arguments: args)
    }
}
