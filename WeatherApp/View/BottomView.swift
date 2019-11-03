//
//  BottomView.swift
//  WeatherApp
//
//  Created by ds-mayur on 10/22/19.
//  Copyright © 2019 Mayur Rathod. All rights reserved.
//

import SwiftUI

struct BottomView : View {
    
    @Binding var isSliderOpen : Bool
    
    var body: some View {
        VStack() {
            HStack{
                Image(systemName: "clock")
                    .resizable()
                    .foregroundColor(Color("clockColor"))
                    .frame(width: 24, height: 24)
                
                Text("Today's Changes")
                    .font(.headline)
                    .padding()
                
                Spacer()
                
                Image(systemName: "calendar")
                    .resizable()
                    .foregroundColor(Color("pink"))
                    .frame(width: 24, height: 24)
            }
            .padding(.horizontal, 30)
            .padding()
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(alignment: .center, spacing: 10) {
                    
                    ForEach(0...3, id: \.self) { item in
                        
                        VStack {
                            
                            Text("1 AM")
                                .font(.subheadline)
                                .foregroundColor(Color.gray)
                            
                            Image(systemName: "cloud.drizzle")
                                .resizable()
                                .frame(width: 48, height: 48)
                                .foregroundColor(Color("bottomText"))
                            
                            Text("21°")
                                .font(.subheadline)
                                .foregroundColor(Color("bottomText"))
                        }.padding()
                    }
                }
                .background(Color.white)
            }
            .padding()
        
        }
        .background(RoundedCorners(color: Color.white,
                                   tl: 35.0,
                                   tr: 35.0,
                                   bl: 0.0,
                                   br: 0.0))
    }
}


struct BottomView_Previews: PreviewProvider {
    static var previews: some View {
        BottomView(isSliderOpen: .constant(false))
    }
}

struct BottomAnimationView : View{
    
    @State private var cardDragState    : CGSize    = CGSize.zero
    @Binding var isAnimationDone        : Bool
    @State var isSliderOpen             : Bool      = false
    
    var body: some View {
        
        BottomView(isSliderOpen: $isSliderOpen)
            .animation(.spring())
            .offset(y: self.cardDragState.height)
            .frame(height: UIScreen.main.bounds.height / 2, alignment: .bottom)
            .gesture(DragGesture()
                .onChanged { value in
                    print("Dragged Value \(value.translation.height)")
                    
                    if(value.translation.height < UIScreen.main.bounds.height / 3){
                        self.cardDragState = value.translation
                    }
            }
            .onEnded { value in
                if(self.isSliderOpen){
                    self.cardDragState.height   = 0
                    self.isSliderOpen           = false
                    self.isAnimationDone        = false
                }else{
                    self.cardDragState.height = -(UIScreen.main.bounds.height / 4)
                    self.isSliderOpen         = true
                    self.isAnimationDone      = true
                }
            }
        )
    }
}
