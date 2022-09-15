//
//  ColorSoliderView.swift
//  ColorizedApp.SwiftUI
//
//  Created by Вадим Гамзаев on 13.09.2022.
//

import SwiftUI

struct ColorSliderView: View {
    
    @Binding var value: Double
    @State private var text = ""
    
    let color: Color
    
    var body: some View {
        HStack {
            Text(value.formatted())
                .foregroundColor(.white)
            Slider(value: $value, in: 0...255, step: 1)
                .tint(color)
                .onChange(of: value) { newValue in
                    text = value.formatted()
                }
            TextFieldView(text: $text, value: $value)
        }
        .onAppear {
            text = value.formatted()
        }
    }
}

struct ColorSlider_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
            ColorSliderView(value: .constant(100), color: .red)
        }
    }
}

