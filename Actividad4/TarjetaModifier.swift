//
//  TarjetaModifier.swift
//  Refactor
//
//  Created by Edna Sanchez  on 27/10/25.
//

import Foundation
import SwiftUI

struct TarjetaModifier: ViewModifier {
    func body(content: Content) -> some View { content
        
        .frame(width: 350, height: 200)
        .cornerRadius(20)
        .padding()
        
    }
}

extension View {
    func TarjetaStyle() -> some View {
        self.modifier(TarjetaModifier())
    }
}
