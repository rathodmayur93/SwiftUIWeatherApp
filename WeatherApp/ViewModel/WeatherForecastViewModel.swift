//
//  WeatherForecastViewModel.swift
//  WeatherApp
//
//  Created by ds-mayur on 10/30/19.
//  Copyright © 2019 Mayur Rathod. All rights reserved.
//

import Foundation
import Combine

class WeatherForecastViewModel : ObservableObject{
    
    //MARK:- Varibales
    @Published var weatherForecastResponse = Forecast()
    private var apiService : APIService
    
    //Variables
    
    //To know whether api call is still in progress or not
    var isLoading: Bool = false{
        didSet{
            //Updating the UI since model has been updated
            self.objectWillChange.send()
        }
    }
    
    //Fetching the city name
    var cityName : String {
        if let city = weatherForecastResponse.city?.name {
            return city
        }else{
            return ""
        }
    }
    
    //Fetching the temp
    var currentTemp : String{
        if let temp = weatherForecastResponse.list?[0].temp.day {
            return "\(Int(temp - 273.0))"
        }else{
            return ""
        }
    }
    
    init(apiService : APIService, endPoints : Endpoint) {
        self.apiService = apiService
        fetchForecastWeatherData(endPoints)
    }
    
    func fetchForecastWeatherData(_ endPoints : Endpoint){
        let group           = DispatchGroup()   // Creating GCC Group
        let queue           = DispatchQueue.global(qos: .background) // Running the queue in background
        //var weatherForecast = ForecastModel()
        
        //We made the api call since isLoading will become true
        isLoading = true
        
        //Making the asyncronous api call
        queue.async(group: group){
         
            group.enter()
            
            self.apiService.fetchWeatherData(from: endPoints,
                                             param: ["q" : "Moscow", "metric" : "celsius"],
                                             successHandler:
                { (response) in
                    
                    self.weatherForecastResponse = response
                    group.leave()
    
            })
            { (error) in
                print(error.localizedDescription)
                group.leave()
            }
        }
        
        group.notify(queue: DispatchQueue.main){
            self.isLoading = false
        }
    }
}
