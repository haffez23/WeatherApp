//
//  NetworkPersistedCacheMock.swift
//  WeatherAppTests
//
//  Created by Mohamed Haffez on 05/02/2024.
//

import Foundation
@testable import WeatherApp
class CachableMock: Cachable {
    var subbedGetCacheItem: CacheItem?
    var invokedGetCacheItem = false
    func getCacheItem<T>(forKey key: String, deserializer: @escaping (Data) throws -> T) -> CacheItem? {
        invokedGetCacheItem = true
        return subbedGetCacheItem
    }
    
    var invokedSetCacheItem = false
    
    func setCacheItem<T>(item: T, forKey key: String, expirationDate: Date) where T : Encodable {
        invokedSetCacheItem = true
    }
}
