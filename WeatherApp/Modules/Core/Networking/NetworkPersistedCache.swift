    //
    //  NetworkPersistedCache.swift
    //  WeatherApp
    //
    //  Created by Mohamed Haffez on 05/02/2024.
    //

import Foundation

struct CacheItem {
    let value: Any
    let expiresAt: Date
    
    func getValue<T>(
        ofType type: T.Type,
        at currentDate: Date
    ) -> T? {
        guard currentDate < expiresAt else {
            return nil
        }
        
        return value as? T
    }
    
}

protocol Cachable {
    func getCacheItem<T>(
        forKey key: String,
        deserializer: @escaping (Data) throws -> T
    ) -> CacheItem?
    
    func setCacheItem<T>(item: T, forKey key: String, expirationDate:Date) where T : Encodable
    
}

final class NetworkPersistedCache: Cachable {
    
    private let cacheDirectoryUrl: URL = {
        let cacheDirectoryUrl = FileManager.default.temporaryDirectory.appendingPathComponent("network_cache")
        
        do {
            try FileManager.default.createDirectory(
                at: cacheDirectoryUrl,
                withIntermediateDirectories: true,
                attributes: nil
            )
        } catch {
            print("Error creating network cache directory")
        }
        
        return cacheDirectoryUrl
    }()
    
    func getCacheItem<T>(
        forKey key: String,
        deserializer: @escaping (Data) throws -> T
    ) -> CacheItem? {
        let cachedItemPath = getCachedItemPath(forKey: key)
        guard let data = try? Data(contentsOf: cachedItemPath) else {
            return nil
        }
        
        let expiresAtTimestampSize = MemoryLayout<Double>.size
        guard data.count >= expiresAtTimestampSize else {
            return nil
        }
        
        let expiresAtTimestampData = data[0..<expiresAtTimestampSize]
        var expiresAtTimestamp: Double = .zero
        let size = withUnsafeMutableBytes(of: &expiresAtTimestamp) {
            expiresAtTimestampData.copyBytes(to: $0)
        }
        guard size == expiresAtTimestampSize else {
            return nil
        }
        
        let dataToDeserialize = data[expiresAtTimestampSize..<data.count]
        guard let value: T = try? deserializer(dataToDeserialize) else {
            print("❌ Can't deserialize persisted network data for \(key) to \(T.self)")
            return nil
        }
        
        return CacheItem(
            value: value,
            expiresAt: Date(timeIntervalSince1970: expiresAtTimestamp)
        )
    }
    
    func setCacheItem<T>(item: T, forKey key: String, expirationDate:Date) where T : Encodable {
        guard let data = try? JSONEncoder().encode(item) else {
            print("❌ Can't serialize item to persist in network cache.")
            return
        }
        let cacheItem = CacheItem(
            value: data,
            expiresAt: expirationDate)
        persist(cacheItem: cacheItem, forKey: key)
    }
    
    private func persist(cacheItem: CacheItem, forKey key: String) {
        guard var dataToPersist = cacheItem.value as? Data else { return }
        
        var expiresAtTimestamp = cacheItem.expiresAt.timeIntervalSince1970
        let expiresAtTimestampData = Data(
            bytes: &expiresAtTimestamp,
            count: MemoryLayout.size(ofValue: expiresAtTimestamp)
        )
        dataToPersist.insert(
            contentsOf: expiresAtTimestampData,
            at: dataToPersist.startIndex
        )
        
        let cachedItemPath = getCachedItemPath(forKey: key)
        do {
            try dataToPersist.write(to: cachedItemPath, options: .atomic)
        } catch {
            print("❌ Error persisting data to network cache.")
        }
    }
    
    func delete(key: String) {
        let cachedItemPath = getCachedItemPath(forKey: key)
        try? FileManager.default.removeItem(at: cachedItemPath)
    }
    
    private func getCachedItemPath(forKey key: String) -> URL {
        cacheDirectoryUrl
            .appendingPathComponent(key)
            .appendingPathExtension("cache")
    }
}
