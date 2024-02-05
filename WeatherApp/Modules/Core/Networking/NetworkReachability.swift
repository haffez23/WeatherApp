//
//  NetworkMonitor.swift
//  WeatherApp
//
//  Created by Mohamed Haffez on 03/02/2024.
//

import Foundation
import Alamofire
protocol NetworkReachabilityStarter {
    func startMonitoring()
}

protocol NetworkReachabilityListenable {
    var isReachable: Bool { get }
    func startListening(_ completion: @escaping (Bool) -> Void)
}

final class NetworkReachability:NetworkReachabilityListenable {
    var isReachable: Bool = false
    
    func startListening(_ completion: @escaping (Bool) -> Void) {
        completion(isReachable)
    }
}

extension NetworkReachabilityManager: NetworkReachabilityListenable {
    var isReachable: Bool {
        switch status{
            case .reachable(_): return true
            default: return false
        }
    }
    
    func startListening(_ completion: @escaping (Bool) -> Void) {
        self.startListening(onUpdatePerforming: {[weak self] _ in
            completion(self?.isReachable ?? false)
        })
    }
}
