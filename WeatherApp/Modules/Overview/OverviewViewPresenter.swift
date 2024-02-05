//
//  OverviewPresenter.swift
//  WeatherApp
//
//  Created by Mohamed Haffez on 02/02/2024.
//

import Foundation

final class OverviewPresenter: OverviewPresentable {
    weak var view: OverviewViewable?
    
    init(view: OverviewViewable?) {
        self.view = view
    }
    
    func present(overview:Overview) {
        let temperature = overview.dailyForecasts.first?.temperature
        let maxTemperature = "\(temperature?.maximum.value ?? 0) \(temperature?.maximum.unit ?? "")"
        let overviewModel = OverviewViewModel(
            headline: overview.headline.text,
            temperature: maxTemperature)
        view?.display(viewModel: overviewModel)
    }
}

protocol OverviewPresentable {
    func present(overview:Overview)
}
