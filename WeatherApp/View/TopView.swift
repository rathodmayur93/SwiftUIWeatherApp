//
//  TopView.swift
//  WeatherApp
//
//  Created by ds-mayur on 10/20/19.
//  Copyright © 2019 Mayur Rathod. All rights reserved.
//

import SwiftUI

struct TopView: View {
    
    @Binding var hideDatePart : Bool
    
    var body: some View {
        
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
                .overlay(OptionView(hideDate: $hideDatePart), alignment: .topTrailing)
        }
            
        .frame(minWidth: 0, maxWidth: UIScreen.main.bounds.width, minHeight: 0, maxHeight: 60, alignment: .topTrailing)
        .edgesIgnoringSafeArea(.all)
        .background(RoundedCorners(color: Color(.white),
                                   tl: 0.0,
                                   tr: 0.0,
                                   bl: 50,
                                   br: 50))
        
        
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView(hideDatePart: .constant(false))
    }
}

struct OptionView: View {
    
    @Binding var hideDate : Bool
    
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
                .foregroundColor(.white)
                .padding()
                .animation(.easeIn(duration: 5.0))
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
