//
//  ColorizedApp_SwiftUIApp.swift
//  ColorizedApp.SwiftUI
//
//  Created by Вадим Гамзаев on 12.09.2022.
//

import SwiftUI

@main
struct ColorizedApp_SwiftUIApp: App {
    
    @StateObject var randomSetter = RandomValueSette()
    
    var body: some Scene {
        WindowGroup {
            ColorizedView().environmentObject(randomSetter)
        }
    }
}
