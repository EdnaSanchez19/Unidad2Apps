//
//  OperacionesCardView.swift
//  tarjetas_nav
//
//  Created by Edna Sanchez on 27/10/25.
//

import SwiftUI

struct OperacionesCardView: View {
    @State private var transacciones = TransaccionViewModel().dummyData()
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Image(systemName: "ellipsis.circle")
            }
            .padding()

            Spacer().frame(height: 20)
            
            VStack(alignment: .leading) {
                TarjetaView(nombre: "BBVA", numero: "123456789", cliente: "Edna Carolina Sánchez Gutiérrez")
                Spacer().frame(height: 20)
                SaldoCardView()
                Text("Transacciones recientes")
                    .fontWeight(.heavy)
                    .padding(.top)
            }
            .padding(.horizontal)

            List {
                ForEach(transacciones) { gasto in
                    TransaccionCardView(
                        image: gasto.image,
                        name: gasto.name,
                        subtitle: gasto.subtitle,
                        date: gasto.date,
                        income: gasto.income
                    )
                }
                .onDelete { indexSet in
                    transacciones.remove(atOffsets: indexSet)
                }
            }
            .listStyle(PlainListStyle())
        }
    }
}

#Preview {
    OperacionesCardView()
}

