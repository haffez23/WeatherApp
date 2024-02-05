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
    var titleLabel: UILabel!
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
        titleLabel = UILabel()
        titleLabel.text = Localization.title.localized
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)

        headlineLabel = UILabel()
        headlineLabel.translatesAutoresizingMaskIntoConstraints = false
        headlineLabel.numberOfLines = 0
        view.addSubview(headlineLabel)
        
        temperatureLabel = UILabel()
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(temperatureLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            headlineLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            headlineLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            headlineLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            temperatureLabel.topAnchor.constraint(equalTo: headlineLabel.bottomAnchor, constant: 20),
            temperatureLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            temperatureLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}

protocol OverviewViewable:AnyObject {
    func display(viewModel: OverviewViewModel)
}

extension OverviewViewController: OverviewViewable {
    func display(viewModel: OverviewViewModel) {
        headlineLabel.text = viewModel.headline
        temperatureLabel.text = viewModel.temperature
    }
}

extension OverviewViewController{
    private enum Localization: String, Localizable{
        case title = "overview.title"
    }
}
