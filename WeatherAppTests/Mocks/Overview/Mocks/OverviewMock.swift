//
//  OverviewMock.swift
//  WeatherAppTests
//
//  Created by Mohamed Haffez on 04/02/2024.
//

import Foundation
@testable import WeatherApp
struct OverviewMock{
    
    static func make() -> Overview {
        let mockHeadline = Headline(
            effectiveDate: Date(),effectiveEpochDate: 0, severity: 0,
            text: "", category: "", endDate: Date(), endEpochDate: 0,
            mobileLink: "", link: ""
        )
        
        return Overview(
            headline: mockHeadline,
            dailyForecasts: []
        )
    }
}
