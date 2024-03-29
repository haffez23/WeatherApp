    //
    //  NetworkingSessionFactory.swift
    //  WeatherApp
    //
    //  Created by Mohamed Haffez on 04/07/2023.
    //

import Alamofire
import Foundation


protocol NetworkManagerExectable{
    func execute<T: Decodable>(
        _ request: NetworkRequest,
        deserializer: @escaping (Data, [AnyHashable: Any]) throws -> T,
        success: @escaping (T) -> Void,
        failure: @escaping (Error) -> Void,
        errorDeserializer: ((Data, Error) throws -> Error)?
    )
}

extension NetworkManagerExectable{
    func execute<T: Decodable>(
        _ request: NetworkRequest,
        jsonDecoder: JSONDecoder =  JSONDecoder(),
        success: @escaping (T) -> Void,
        failure: @escaping (Error) -> Void,
        errorDeserializer: ((Data, Error) throws -> Error)? = nil
    ) {
        execute(
            request,
            deserializer: { (data, _) in try jsonDecoder.decode(T.self, from: data) },
            success: success,
            failure: failure,
            errorDeserializer: errorDeserializer
        )
    }
}
class NetworkManager: NetworkManagerExectable {
    private let session: URLSession
    private let environment: NetworkEnvironment
    
    init(session: URLSession = URLSession.shared,
         environment: NetworkEnvironment
    ) {
        self.environment = environment
        self.session = session
    }
    
    func execute<T>(_ request: NetworkRequest,
                    deserializer: @escaping (Data, [AnyHashable : Any]) throws -> T,
                    success: @escaping (T) -> Void, failure: @escaping (Error) -> Void,
                    errorDeserializer: ((Data, Error) throws -> Error)?) where T : Decodable {
        
        let alamofireRequest: DataRequest
        do {
            alamofireRequest = try prepare(request: request)
        } catch {
            failure(NetworkError.PrepareRequestFailedError)
            return
        }
            // start resquest
        alamofireRequest
            .validate()
            .response{ afResponse in
                switch afResponse.result{
                    case .success(let data):
                        do {
                            let deserializedResponse = try deserializer(
                                data ?? Data(),
                                afResponse.response?.allHeaderFields.reduce(into: [:]) {
                                    $0[String(describing: $1.key).lowercased()] = $1.value
                                } ?? [:]
                            )
                            
                            success(
                                deserializedResponse
                            )
                        }catch{
                            print(error)
                            failure(NetworkError.DeserializationDecodingError)
                        }
                    case .failure(let error):
                        failure(error)
                }
            }
    }
    
    
    func prepare(request: NetworkRequest) throws -> DataRequest  {
            // Build absolute url
        let fullUrl: URL
        print("PATH", environment.buildUrl(fromPath: request.path))
        if let validUrl = URL(string: environment.buildUrl(fromPath: request.path)) {
            fullUrl = validUrl
        } else {
            throw NetworkError.BadRequest
        }
        
        let fullHeaders = HTTPHeaders(environment.headers.merging(request.headers ?? [:]) { $1 })
        
        print("HEADERS", environment.headers)
        
            // Build the alamofire request
        switch request.parameters {
            case .body(let params):
                return AF.request(
                    fullUrl,
                    method: request.method,
                    parameters: params,
                    encoding: JSONEncoding.default,
                    headers: fullHeaders
                )
                
            case .url(let params):
                return AF.request(
                    fullUrl,
                    method: request.method,
                    parameters: params,
                    encoding: URLEncoding(arrayEncoding: .noBrackets),
                    headers: fullHeaders
                )
        }
        
    }
}

    // NetworkError Enum
enum NetworkError: Error {
    case noData, PrepareRequestFailedError, DeserializationDecodingError, BadRequest
}
