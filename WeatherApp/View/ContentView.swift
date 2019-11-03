//
//  ContentView.swift
//  WeatherApp
//
//  Created by ds-mayur on 10/20/19.
//  Copyright © 2019 Mayur Rathod. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isBottomViewAnimated = false
    @ObservedObject var weatherForecastVM : WeatherForecastViewModel
    
    init() {
        self.weatherForecastVM = WeatherForecastViewModel(apiService: APICall.shared,
                                                          endPoints: Endpoint.dailyForecast)
    }
    
    var body: some View {
        
        VStack {
            
            TopView(hideDatePart: $isBottomViewAnimated)
            
            Spacer()
            
            //Center View with tempreture, feels like and Weather Image
            CenterView(isBottomViewAnimated: $isBottomViewAnimated,
                       cityName: weatherForecastVM.cityName,
                       temp: weatherForecastVM.currentTemp)
                .offset(y: UIScreen.main.bounds.height / 4)
            
            Spacer()
            
            BottomAnimationView(isAnimationDone: $isBottomViewAnimated)
                .offset(y: UIScreen.main.bounds.height / 3.5)

                //Weather App Bottom View
                //BottomAnimationView()
            /*
            Text("Mumbai")
            .font(.custom("Arial", size: 40))
            .fontWeight(.bold)
            .foregroundColor(.white)
            .frame(width: UIScreen.main.bounds.width - 24, height: 60, alignment: .leading)
            .padding(.leading, 24)
            */
        }
        .background(Color("background"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
