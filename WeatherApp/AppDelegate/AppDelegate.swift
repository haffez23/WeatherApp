    //
    //  AppDelegate.swift
    //  WeatherApp
    //
    //  Created by Mohamed Haffez on 02/02/2024.
    //

import UIKit
import Alamofire

@main
class AppDelegate: UIResponder {
    var window: UIWindow?
    private var reachabilityManager:NetworkReachabilityListenable?
}


extension AppDelegate: UIApplicationDelegate{
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(
            rootViewController: OverviewWeatherFactory(
                reachabilityStarter: self,
                appearanceSwitcher: self
            ).make()
        )
        window?.makeKeyAndVisible()
        return true
    }
}

extension AppDelegate: NetworkReachabilityStarter {
    func startMonitoring() {
        reachabilityManager = NetworkReachabilityManager()
        reachabilityManager?.startListening({ status in
            status ? print("Reachable") : print("Unreachable")
        })
    }
}

extension AppDelegate:AppearanceSwitchable{
    func switchToDark() {
        window?.overrideUserInterfaceStyle = .dark
    }
    
    func switchToLight() {
        window?.overrideUserInterfaceStyle = .light
    }
}
