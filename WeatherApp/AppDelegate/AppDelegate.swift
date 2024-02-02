    //
    //  AppDelegate.swift
    //  WeatherApp
    //
    //  Created by Mohamed Haffez on 02/02/2024.
    //

import UIKit

@main
class AppDelegate: UIResponder {
    var window: UIWindow?
}


extension AppDelegate: UIApplicationDelegate{
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(
            rootViewController: OverviewFactory.make()
        )
        window?.makeKeyAndVisible()
        return true
    }
}
