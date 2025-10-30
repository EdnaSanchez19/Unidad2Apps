//
//  LogoView.swift
//  tarjetas_nav
//
//  Created by Edna Sanchez on 27/10/25.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        ZStack{
            Circle()
                .foregroundStyle(Color.blue)
                .frame(maxWidth: 35)
                .overlay {
                Circle().stroke(lineWidth: 2)
                }
            Circle()
                .foregroundStyle(Color.orange)
                .frame(maxWidth: 35)
                .overlay {
                Circle().stroke(lineWidth: 2)
                }
                .offset(x:23, y: 0)
            Text("Visa").foregroundStyle(Color.white)
                .fontWeight(.heavy)
                .font(.system(size:10))
                .offset(x:10, y:1)
        }
    }
}

#Preview {
    LogoView()
}
