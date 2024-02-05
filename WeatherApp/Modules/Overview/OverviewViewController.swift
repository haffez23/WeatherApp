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
    var appearanceHintLabel: UILabel!
    var headlineLabel: UILabel!
    var temperatureLabel: UILabel!
    let modeSwitch = UISwitch()

        // MARK: - Deps
    fileprivate let didLoadController:ViewDidLoadControllable
    fileprivate let didToggleController:ViewDidToggleControllable
    
        // MARK: - Lifecycle
    init(didLoadController:ViewDidLoadControllable, didToggleController:ViewDidToggleControllable) {
        self.didLoadController = didLoadController
        self.didToggleController = didToggleController
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
        view.backgroundColor = Color.background.color
        
        titleLabel = UILabel()
        titleLabel.text = Localization.title.localized
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = Color.text.color
        view.addSubview(titleLabel)

        headlineLabel = UILabel()
        headlineLabel.translatesAutoresizingMaskIntoConstraints = false
        headlineLabel.numberOfLines = 0
        headlineLabel.textColor = Color.text.color
        view.addSubview(headlineLabel)
        
        temperatureLabel = UILabel()
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.textColor = Color.text.color
        view.addSubview(temperatureLabel)
        
        appearanceHintLabel = UILabel()
        appearanceHintLabel.translatesAutoresizingMaskIntoConstraints = false
        appearanceHintLabel.textColor = Color.text.color
        appearanceHintLabel.text = Localization.appearanceHint.localized
        view.addSubview(appearanceHintLabel)
        
        view.addSubview(modeSwitch)
        modeSwitch.translatesAutoresizingMaskIntoConstraints = false
        modeSwitch.isOn = view.overrideUserInterfaceStyle == .dark
        modeSwitch.addTarget(self, action: #selector(toggleDarkMode), for: .valueChanged)
                
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            headlineLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            headlineLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            headlineLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            temperatureLabel.topAnchor.constraint(equalTo: headlineLabel.bottomAnchor, constant: 20),
            temperatureLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            temperatureLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            modeSwitch.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            modeSwitch.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            appearanceHintLabel.bottomAnchor.constraint(equalTo: modeSwitch.topAnchor, constant: -20),
            appearanceHintLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func toggleDarkMode(_ sender: UISwitch) {
        didToggleController.didToggle(isOn: sender.isOn)
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
        case appearanceHint = "overview.appearance_hint"
    }
}
