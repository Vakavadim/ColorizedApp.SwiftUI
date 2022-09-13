//
//  ContentView.swift
//  ColorizedApp.SwiftUI
//
//  Created by Вадим Гамзаев on 12.09.2022.
//

import SwiftUI

struct ColorizedView: View {
    
    enum FocusedField {
        case red, green, blue
    }
    @State private var alertPresented = false
    
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var greenSliderValue = Double.random(in: 0...255)
    @State private var blueSliderValue = Double.random(in: 0...255)
    
    @State private var redValueString = ""
    @State private var greenValueString = ""
    @State private var blueValueString = ""

    @FocusState var redTextFieldFocused: Bool
    @FocusState var greenTextFieldFocused: Bool
    @FocusState var blueTextFieldFocused: Bool
    
    var body: some View {
        VStack {
            ColorView(redValue: $redSliderValue,
                      greenValue: $greenSliderValue,
                      blueValue: $blueSliderValue)
            VStack {
                ColorSliderView(color: .red, alertPresented: $alertPresented, value: $redSliderValue, textValue: $redValueString)
                    .focused($redTextFieldFocused)
                ColorSliderView(color: .green, alertPresented: $alertPresented, value: $greenSliderValue, textValue: $greenValueString)
                    .focused($greenTextFieldFocused)
                ColorSliderView(color: .blue, alertPresented: $alertPresented, value: $blueSliderValue, textValue: $blueValueString)
                    .focused($blueTextFieldFocused)
                    
            }
            .padding()
            Spacer()
        }
        .alert("Wrong Format", isPresented: $alertPresented, actions: {}) {
            Text("Enter the number from 1 to 255")
        }
        .background(.indigo)
        .onTapGesture {
            endEditing()
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
                Button(action: endEditing) {
                    Text("Done")
                }
            }
        }
    }
    
    private func currentFocus() -> FocusedField {
        
        var currentFocus: FocusedField
        if redTextFieldFocused {
            currentFocus = .red
        } else {
            if greenTextFieldFocused {
                currentFocus = .green
            } else {
                currentFocus = .blue
            }
        }
        
        return currentFocus
    }
    
    private func endEditing() {
        
        let currentFocus = currentFocus()
        
        switch currentFocus {
        case .red:
            redTextFieldFocused.toggle()
        case .green:
            greenTextFieldFocused.toggle()
        case .blue:
            blueTextFieldFocused.toggle()
        }
        
        
       }
    
    private func previusTextField() {
        
        var currentFocus = currentFocus()

        switch currentFocus {
        case .red:
            currentFocus = .blue
            blueTextFieldFocused.toggle()
        case .green:
            currentFocus = .red
            redTextFieldFocused.toggle()
        case .blue:
            currentFocus = .green
            greenTextFieldFocused.toggle()
        }
        
    }
    
    private func nextTextField() {
        
        var currentFocus = currentFocus()

        switch currentFocus {
        case .red:
            currentFocus = .green
            greenTextFieldFocused.toggle()
        case .green:
            currentFocus = .blue
            blueTextFieldFocused.toggle()
        case .blue:
            currentFocus = .red
            redTextFieldFocused.toggle()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ColorizedView()
    }
}
