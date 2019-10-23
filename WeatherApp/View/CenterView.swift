//
//  CenterView.swift
//  WeatherApp
//
//  Created by ds-mayur on 10/21/19.
//  Copyright © 2019 Mayur Rathod. All rights reserved.
//

import SwiftUI

struct CenterView: View {
    var body: some View {
        ZStack(alignment: .topLeading){
            
            Image("umbrella")
                .resizable()
                .frame(width: UIScreen.main.bounds.width,
                       height: UIScreen.main.bounds.height,
                       alignment: .trailing)
                .scaledToFit()
            
            VStack(alignment: .leading) {
                
                Text("19°")
                    .font(.custom("Arial", size: 50))
                    .foregroundColor(.white)
                
                Text("Feels like 17°")
                    .font(.custom("Arial", size: 18))
                    .foregroundColor(.white)
                
                Image(systemName: "cloud.bolt.rain")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 36, height: 36)
                
            }
            .padding([.top, .leading], 24)
            .padding(.top, 24)
        }
        .background(Color("background"))
        .edgesIgnoringSafeArea(.all)
    }
}


struct CenterView_Previews: PreviewProvider {
    static var previews: some View {
        CenterView()
    }
}
