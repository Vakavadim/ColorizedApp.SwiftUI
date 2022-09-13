//
//  RandomValueSetter.swift
//  ColorizedApp.SwiftUI
//
//  Created by Вадим Гамзаев on 13.09.2022.
//

import Foundation

class RandomValueSette: ObservableObject {
    
    let randomRedValue = Double.random(in: 0...255)
    let randomGreenValue = Double.random(in: 0...255)
    let randomBlueValue = Double.random(in: 0...255)

}
