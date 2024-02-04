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
    var label: UILabel = {
        let label = UILabel()
        return label
    }()
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
        view.addSubview(label)
        didLoadController.didLoadViews()
    }
}

extension OverviewViewController: OverviewViewable {
    func display(viewModel: OverviewViewModel) {
        label.text = viewModel.title
    }
}

protocol OverviewViewable:AnyObject {
    func display(viewModel: OverviewViewModel)
}
