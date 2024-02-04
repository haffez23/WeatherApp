//
//  OverviewPresenter.swift
//  WeatherApp
//
//  Created by Mohamed Haffez on 02/02/2024.
//

import Foundation

final class OverviewPresenter: OverviewPresentable {
    private weak var view: OverviewViewable?
    
    init(view: OverviewViewable?) {
        self.view = view
    }
    
    func present(overview:Any) {
        view?.display(viewModel: OverviewViewModel(title: ""))
    }
}

protocol OverviewPresentable {
    func present(overview:Any)
}
