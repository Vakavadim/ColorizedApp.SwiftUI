//
//  TextField + BorderViewModifier.swift
//  ColorizedApp.SwiftUI
//
//  Created by Вадим Гамзаев on 13.09.2022.
//

import SwiftUI

struct BorderedViewModifier: ViewModifier  {
    func body(content: Content) -> some View {
        content
            .frame(width: 40, height: 10, alignment: .trailing)
            .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
//            .overlay(
//                RoundedRectangle(cornerRadius: 4)
//                    .stroke(lineWidth: 1)
//                    .foregroundColor(.gray)
//            )
            .background(.white)
            .cornerRadius(4)
            .shadow(color: Color.gray.opacity(0.2), radius: 3, x: 1, y: 2)
    }
}

extension TextField {
    func bordered() -> some View {
        ModifiedContent(content: self, modifier: BorderedViewModifier())
    }
}


