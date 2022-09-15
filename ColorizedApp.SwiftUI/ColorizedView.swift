//
//  ContentView.swift
//  ColorizedApp.SwiftUI
//
//  Created by Вадим Гамзаев on 12.09.2022.
//

import SwiftUI

/* Алексей, здраствуйте.
 
 У меня проблемы c life-cycle и архетиктурой.
 Я бы хотел инициализировать следующие три свойства во внешнем классе и применять к SliderValue и redValueString, но пока инциализировать внешний класс с данными в singl view app не удается.
 
 let randomRedValue = Double.random(in: 0...255)
 let randomGreenValue = Double.random(in: 0...255)
 let randomBlueValue = Double.random(in: 0...255)
 
 пробовал @ObservedObject / @EnvironmentObject и Singlton.
 Всегда проблема  initializers run before 'self' is available
 
 Отправлять решение с размещением свойств вне области структур не стал, хотя так и работало(
 
 Понимаю, что существует элегантное решение, где можно обойтись без костылей и внешних классах, но я этого решения не нашел.

 Буду передавать значение в placeholder
 
 Думал поменять цвет placeholder на черный, но API на параметр нет, там тоже костыли =)
 Вот как то так(

 */
 
struct ColorizedView: View {
    
    private enum Field {
        case red
        case green
        case blue
    }
    
    @State private var redSliderValue = Double.random(in: 0...255).rounded()
    @State private var greenSliderValue = Double.random(in: 0...255).rounded()
    @State private var blueSliderValue = Double.random(in: 0...255).rounded()

    @FocusState private var focusedField: Field?

    
    var body: some View {
        ZStack {
            
            Color(.gray)
                .ignoresSafeArea()
                .onTapGesture {
                    focusedField = nil
                }
                
            VStack {
                ColorView(redValue: $redSliderValue,
                          greenValue: $greenSliderValue,
                          blueValue: $blueSliderValue)
                VStack {
                    ColorSliderView(value: $redSliderValue, color: .red)
                        .focused($focusedField, equals: .red)
                    ColorSliderView(value: $greenSliderValue, color: .green)
                        .focused($focusedField, equals: .green)
                    ColorSliderView(value: $blueSliderValue, color: .blue)
                        .focused($focusedField, equals: .blue)
                    
                }
                .padding()
                Spacer()
            }
            .toolbar {
                ToolbarItemGroup(placement: ToolbarItemPlacement.keyboard) {
                    Button(action: previusTextField) {
                        Image(systemName: "chevron.up")
                    }
                    Button(action: nextTextField) {
                        Image(systemName: "chevron.down")
                    }
                    Spacer()
                    Button("Done") {
                        focusedField = nil
                    }
                }
            }
        }
    }
    
    private func previusTextField() {

        switch focusedField {
        case .red:
            focusedField = .blue
        case .green:
            focusedField = .red
        case .blue:
            focusedField = .green
        case .none:
            focusedField = nil
        }
        
    }
    
    private func nextTextField() {
        
        switch focusedField {
        case .red:
            focusedField = .green
        case .green:
            focusedField = .blue
        case .blue:
            focusedField = .red
        case .none:
            focusedField = nil
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ColorizedView()
    }
}
