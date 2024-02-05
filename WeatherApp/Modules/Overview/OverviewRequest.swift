    //
    //  OverviewRequest.swift
    //  WeatherApp
    //
    //  Created by Mohamed Haffez on 04/02/2024.
    //

import Foundation
import Alamofire

class OverviewRequest:NetworkRequest{
    var locationId:String = ""
    private let apikey = NetworkEnvironment.weatherApi.apikey
    
    var path: String{
        return "/forecasts/v1/daily/1day/\(locationId)"
    }
    
    var method: HTTPMethod{
        return .get
    }
    
    var parameters: RequestParams {
        return .url(["apikey":apikey])
    }
    
    var headers: [String : String]?{
        return [:]
    }
}
