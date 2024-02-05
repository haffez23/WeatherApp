//
//  Color.swift
//  WeatherApp
//
//  Created by Mohamed Haffez on 05/02/2024.
//

import UIKit

enum Color: String {
    case text = "text"
    case background = "background"
    
    var color: UIColor? {
        return UIColor(named: self.rawValue)
    }
}
