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
            effectiveDate: "2024-02-07T19:00:00+01:00",effectiveEpochDate: 0, severity: 0,
            text: "", category: "", endDate: "2024-02-07T19:00:00+01:00", endEpochDate: 0,
            mobileLink: "", link: ""
        )
        
        return Overview(
            headline: mockHeadline,
            dailyForecasts: []
        )
    }
}
