//
//  CenterView.swift
//  WeatherApp
//
//  Created by ds-mayur on 10/21/19.
//  Copyright © 2019 Mayur Rathod. All rights reserved.
//

import SwiftUI

struct CenterView: View {
    
    @Binding var isBottomViewAnimated : Bool
    
    var cityName    : String
    var temp        : String
    
    var body: some View {
        
        VStack{
            VStack(alignment: .leading) {
                
                TempretureView(currentTemp: temp)
                
                HStack {
                    Spacer()
                    Image("Illustration5")
                    Spacer()
                }.padding(20)
                
                Spacer()
                
                Text(cityName)
                    .font(.custom("Arial", size: 40))
                    .fontWeight(.bold)
                    .offset(y: isBottomViewAnimated ? -(UIScreen.main.bounds.height / 4) : 0)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .animation(.linear(duration: 0.3))
                    .padding()
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(Color("background"))
        .edgesIgnoringSafeArea(.all)
        .padding(.bottom, 20)

        
    }
}


struct CenterView_Previews: PreviewProvider {
    static var previews: some View {
        CenterView(isBottomViewAnimated: .constant(false), cityName: "", temp: "")
    }
}

struct TempretureView: View {
    
    var currentTemp : String
    
    var body: some View {
        VStack(alignment: .leading){
            
            Text(currentTemp + "°")
                .font(.custom("Arial", size: 50))
                .foregroundColor(.white)
            
            Text("Feels like 17°")
                .font(.custom("Arial", size: 18))
                .foregroundColor(.white)
            
            Image(systemName: "cloud.bolt.rain")
                .resizable()
                .foregroundColor(.white)
                .frame(width: 36, height: 36)
                .padding(.top, 16)
        }
        .padding(.horizontal)
        .padding()
    }
}
