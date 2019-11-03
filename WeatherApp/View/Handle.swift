//
//  Handle.swift
//  WeatherApp
//
//  Created by ds-mayur on 10/24/19.
//  Copyright © 2019 Mayur Rathod. All rights reserved.
//

import SwiftUI

struct Handle : View {
    private let handleThickness = CGFloat(5.0)
    var body: some View {
        RoundedRectangle(cornerRadius: handleThickness / 2.0)
            .frame(width: 40, height: handleThickness)
            .foregroundColor(Color.secondary)
            .padding(5)
    }
}
