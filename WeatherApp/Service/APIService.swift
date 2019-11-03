//
//  APIService.swift
//  WeatherApp
//
//  Created by ds-mayur on 10/28/19.
//  Copyright © 2019 Mayur Rathod. All rights reserved.
//

import Foundation

protocol APIService {
    
    func fetchWeatherData(from endpoint : Endpoint,
                          param : [String : String]?,
                          successHandler: @escaping(_ response: Forecast)-> Void,
                          errorHandler: @escaping(_ error : Error) -> Void)
}


public enum Endpoint : String{
    
    case dailyForecast = "/data/2.5/forecast/daily"
}

public enum APIErrors: Error{
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case serializationError
}
