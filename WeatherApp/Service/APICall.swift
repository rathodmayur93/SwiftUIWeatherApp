//
//  APICall.swift
//  WeatherApp
//
//  Created by ds-mayur on 10/28/19.
//  Copyright © 2019 Mayur Rathod. All rights reserved.
//

import Foundation
import Alamofire

class APICall : APIService{
    
    public static let shared = APICall()
    private let urlSession   = URLSession.shared
    private let apiKey       = AppConstants.api_key
    
    private let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .useDefaultKeys
        return jsonDecoder
    }()
    
    
    //MARK: Protocol APIService Method
    func fetchWeatherData(from endpoint: Endpoint, param: [String : String]?, successHandler: @escaping (Forecast) -> Void, errorHandler: @escaping (Error) -> Void)
    {
        //Creating the URL Components of the Forecast API
        guard var urlComponents = URLComponents(string: "\(AppConstants.base_url)\(endpoint.rawValue)") else {
            errorHandler(APIErrors.invalidEndpoint)
            return
        }
        
        //Appending the query parameters required to make the api request
        var queryItems = [URLQueryItem(name: "appid", value: apiKey)]
        if let params = param{
            queryItems.append(contentsOf: params.map { URLQueryItem(name: $0.key, value: $0.value) })
        }
        
        //Appending the query parameters to the URLComponents
        urlComponents.queryItems = queryItems
        
        //Fetching the URL with parameter from the URLComponents
        guard let url = urlComponents.url else{
            errorHandler(APIErrors.invalidEndpoint)
            return
        }
        
        print("============== API : \(url.absoluteString)")
        
        //Making the API Request Using the Alamofire Framework
        Alamofire.request(url,
                          method: .get,
                          parameters: nil).response
            { (response) in
                
                if response.error != nil {
                    self.handleError(errorHandler: errorHandler, error: APIErrors.apiError)
                    return
                }
                
                guard let httpResponse = response.response, 200..<300 ~= httpResponse.statusCode else{
                    self.handleError(errorHandler: errorHandler, error: APIErrors.noData)
                    return
                }
                
                guard let responseData = response.data else {
                    self.handleError(errorHandler: errorHandler, error: APIErrors.noData)
                    return
                }
                
                do{
                    let weatherResponse = try self.jsonDecoder.decode(Forecast.self, from: responseData)
                    DispatchQueue.main.async {
                        successHandler(weatherResponse)
                        print("Success \(weatherResponse)")
                    }
                    
                }catch {
                    print("Error: \(error)")
                    self.handleError(errorHandler: errorHandler, error: APIErrors.serializationError)
                }
        }
    }
    
    private func handleError(errorHandler: @escaping(_ error: Error) -> Void, error: Error) {
        DispatchQueue.main.async {
            errorHandler(error)
        }
    }
}
