//
//  CardView.swift
//  Refactor
//
//  Created by Edna Sanchez  on 27/10/25.
//

import SwiftUI

struct CardView: View {
    var name: String
    var imagen: String
    
    var body: some View {
        VStack(){
            Image(imagen)
                .resizable()
                .frame(width: 380, height: 240)
            
            Text(name)
                .font(.title)
                .lineLimit(1)
                .bold(true)
                .truncationMode(.middle)
            
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(red: 130/255, green: 130/255, blue: 130/255, opacity: 0.2), lineWidth: 2)
        ).padding()
    }
}

#Preview {
    CardView(name: "Combos", imagen: "combos")
}

