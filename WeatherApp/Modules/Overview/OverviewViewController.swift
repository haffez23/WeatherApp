    //
    //  OverviewViewController.swift
    //  WeatherApp
    //
    //  Created by Mohamed Haffez on 02/02/2024.
    //

import Foundation
import UIKit

final class OverviewViewController: UIViewController {
        // MARK: - UI
    var headlineLabel: UILabel!
    var temperatureLabel: UILabel!
        // MARK: - Deps
    fileprivate let didLoadController:ViewDidLoadControllable
    
        // MARK: - Lifecycle
    init(didLoadController:ViewDidLoadControllable) {
        self.didLoadController = didLoadController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        didLoadController.didLoadViews()
    }
}

extension OverviewViewController{
    private func setupUI() {
        headlineLabel = UILabel()
        headlineLabel.translatesAutoresizingMaskIntoConstraints = false
        headlineLabel.numberOfLines = 0
        view.addSubview(headlineLabel)
        
        temperatureLabel = UILabel()
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(temperatureLabel)
        
        NSLayoutConstraint.activate([
            headlineLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            headlineLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            headlineLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            temperatureLabel.topAnchor.constraint(equalTo: headlineLabel.bottomAnchor, constant: 20),
            temperatureLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            temperatureLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}

extension OverviewViewController: OverviewViewable {
    func display(viewModel: OverviewViewModel) {
        headlineLabel.text = viewModel.headline
        temperatureLabel.text = viewModel.temperature
    }
}

protocol OverviewViewable:AnyObject {
    func display(viewModel: OverviewViewModel)
}
