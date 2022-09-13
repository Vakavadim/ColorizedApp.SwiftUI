//
//  ColorSoliderView.swift
//  ColorizedApp.SwiftUI
//
//  Created by Вадим Гамзаев on 13.09.2022.
//

import SwiftUI

struct ColorSliderView: View {
    let color: Color
    @Binding var alertPresented: Bool
    @Binding var value: Double
    @Binding var textValue: String
    
    var body: some View {
        HStack {
            Text("\(lround(value))")
                .foregroundColor(.white)
            Slider(value: $value, in: 0...255)
                .tint(color)
                .onChange(of: value) {
                    textValue = "\(lround($0))"
                }
            TextField(String(lround(value)), text: $textValue)
                .bordered()
                .foregroundColor(.black)
                .keyboardType(.decimalPad)
                .multilineTextAlignment(.trailing)
                .onChange(of: textValue) {
                    if Double(textValue) != nil && Double(textValue)! <= 255 {
                        self.value = Double($0)!
                    } else {
                        alertPresented = true
                    }
                }
        }
    }
}
