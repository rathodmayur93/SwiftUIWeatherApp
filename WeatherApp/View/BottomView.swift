//
//  BottomView.swift
//  WeatherApp
//
//  Created by ds-mayur on 10/22/19.
//  Copyright © 2019 Mayur Rathod. All rights reserved.
//

import SwiftUI

struct BottomView : View {
    var body: some View {
        VStack {
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
            .background(RoundedCorners(color: Color.white,
                                       tl: 35.0,
                                       tr: 35.0,
                                       bl: 0.0,
                                       br: 0.0))
            
//            List{
//                ForEach(0...5, id: \.self) { item in
//                    Text("\(item)")
//                }
//            }
        }
        
    }
}


struct BottomView_Previews: PreviewProvider {
    static var previews: some View {
        BottomAnimationView()
    }
}

struct BottomAnimationView : View{
    
    @State private var cardDragState : CGSize = CGSize.zero
    
    var body: some View{
        
        BottomView()
            .animation(.spring())
            .offset(y: self.cardDragState.height)
            .gesture(DragGesture()
                .onChanged { value in
                    print("Dragged Value \(value.translation.height)")
                    self.cardDragState = value.translation
            }
            .onEnded { value in
                self.cardDragState = .zero
                }
        )
    }
}
