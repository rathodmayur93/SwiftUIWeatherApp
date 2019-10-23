//
//  ContentView.swift
//  WeatherApp
//
//  Created by ds-mayur on 10/20/19.
//  Copyright © 2019 Mayur Rathod. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            
            //Center View with tempreture, feels like and Weather Image
            CenterView()
                .overlay(TopView(), alignment: .top)
                .overlay(BottomAnimationView(), alignment: .bottom)
            
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
            Spacer()
        }
        .background(Color("background"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
