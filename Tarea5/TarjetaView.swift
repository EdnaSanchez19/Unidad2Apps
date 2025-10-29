//
//  TarjetaView.swift
//  tarjetas_nav
//
//  Created by Edna Sanchez on 27/10/25.
//

import SwiftUI

struct TarjetaView: View {
    var nombre: String
    var numero: String
    var cliente: String
    var body: some View {
        VStack{
            VStack(alignment: .leading, spacing: 12){
                HStack{
                    Text(nombre)
                        .foregroundStyle(Color.white)
                    Spacer().frame(width: 150)
                    Image(systemName:"wifi.exclamationmark")
                        .rotationEffect(.degrees(90))
                        .foregroundStyle(Color.black)
                }
                HStack{
                    Text(numero).fontWeight(.heavy)
                }
                HStack{
                    Text(cliente)
                }
                VStack{
                    HStack{
                        LogoView()
                            .offset(x:180,y:20)
                    }
                }
            }.frame(maxWidth: 300, maxHeight: 200)
                .background(Color.gray)
                .cornerRadius(20)
        }
    }
}

#Preview {
    TarjetaView(nombre: "Banamex", numero: "123456789",cliente: "Edna Sanchez")
}

