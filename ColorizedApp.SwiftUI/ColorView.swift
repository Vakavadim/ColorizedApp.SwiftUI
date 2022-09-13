//
//  ColorView.swift
//  ColorizedApp.SwiftUI
//
//  Created by Вадим Гамзаев on 13.09.2022.
//

import SwiftUI

struct ColorView: View {
    
    @Binding var redValue: Double
    @Binding var greenValue: Double
    @Binding var blueValue: Double
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(height: 250)
            .foregroundColor(Color(red: redValue/255,
                                   green: greenValue/255,
                                   blue: blueValue/255))
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 5)
                    .foregroundColor(.white)
            )
            .padding()
    }
}
