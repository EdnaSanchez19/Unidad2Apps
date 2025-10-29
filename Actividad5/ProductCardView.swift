//
//  ProductCardView.swift
//  Refactor
//
//  Created by Edna Sanchez  on 27/10/25.
//

import SwiftUI

struct ProductCardView: View {
    var valores: [(String, String)]
    
    var body: some View {
        ScrollView(.vertical) {
                VStack(){
                ForEach(valores, id: \.0) { producto in
                    Image(producto.1)
                        .resizable()
                        .frame(width: 380, height: 240)
                    
                    Text(producto.0)
                        .font(.title)
                        .lineLimit(1)
                        .bold(true)
                        .truncationMode(.middle)
                    
                }
                .frame(alignment: .center)
                .cornerRadius(12)
            }
        }
    }
}

#Preview {
    ProductCardView(valores:
                    [ ("Combo Clásico", "combo1"),
                      ("Combo Nachos", "combo2"),
                      ("Combo Junior", "combo3"),
                      ("Combo Cornetto", "combo4") ])
}
