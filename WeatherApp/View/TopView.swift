//
//  TopView.swift
//  WeatherApp
//
//  Created by ds-mayur on 10/20/19.
//  Copyright © 2019 Mayur Rathod. All rights reserved.
//

import SwiftUI

struct TopView: View {
    var body: some View {
        
        ZStack(alignment: .top){
            
            HStack(alignment: .center){
                
                Image(systemName: "location.fill")
                    .resizable()
                    .frame(width: 30.0, height: 30.0, alignment: .center)
                    .offset(x: 80)
                    .foregroundColor(Color("pink"))
                
                Text("Today's Weather")
                    .font(.headline)
                    .foregroundColor(.black)
                    .frame(width: UIScreen.main.bounds.width, height: 100)
                    .overlay(OptionView(), alignment: .topTrailing)
                
                
            }
            .background(RoundedCorners(color: Color(.white),
                                       tl: 0.0,
                                       tr: 0.0,
                                       bl: 35,
                                       br: 35))
            
        }
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView()
    }
}

struct OptionView: View {
    var body: some View {
        
        VStack{
            Image(systemName: "text.badge.plus")
                .resizable()
                .frame(width: 24.0, height: 24.0)
                .padding(18)
                .padding(.top, 20)
                .foregroundColor(.white)
            
            Text("Sat \n 03")
                .font(.subheadline)
                .frame(width: 48, height: 48)
                .foregroundColor(.blue)
                .padding()
                .background(RoundedCorners(color: Color("darkPink"),
                                           tl: 0.0,
                                           tr: 0.0,
                                           bl: 35.0,
                                           br: 0.0))
        }
        .background(RoundedCorners(color: Color("pink"),
                                   tl: 0.0,
                                   tr: 0.0,
                                   bl: 35.0,
                                   br: 0.0))
        
    }
}
