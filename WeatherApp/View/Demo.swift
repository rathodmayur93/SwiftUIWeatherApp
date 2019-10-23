//
//  Demo.swift
//  WeatherApp
//
//  Created by ds-mayur on 10/22/19.
//  Copyright © 2019 Mayur Rathod. All rights reserved.
//

import SwiftUI

struct Demo: View {
    var body: some View {
        
        VStack{
            CenterView()
                .overlay(TopView(), alignment: .top)
                .overlay(BottomView(), alignment: .bottom)
            
        }
        .background(Color("background"))
    }
}

struct Demo_Previews: PreviewProvider {
    static var previews: some View {
        Demo()
    }
}
