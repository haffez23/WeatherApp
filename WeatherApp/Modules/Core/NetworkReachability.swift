//
//  NetworkMonitor.swift
//  WeatherApp
//
//  Created by Mohamed Haffez on 03/02/2024.
//

import Foundation

protocol NetworkReachabilityStarter {
    func startMonitoring()
}

protocol NetworkReachabilityListenable {
    var isReachable: Bool { get }
    func startListening(_ completion: @escaping (Bool) -> Void)
    func stopListening()
}

final class NetworkReachability:NetworkReachabilityListenable {
    var isReachable: Bool = false
    
    func startListening(_ completion: @escaping (Bool) -> Void) {
        completion(isReachable)
    }
    
    func stopListening() {
        isReachable = false
    }
}
