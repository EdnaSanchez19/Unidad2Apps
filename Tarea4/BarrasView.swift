//
//  BarrasView.swift
//  Refactor
//
//  Created by Edna Sanchez  on 27/10/25.
//

import SwiftUI
import Charts

struct BarrasView: View {
    @State private var mostrar = false
    
    let datos: [(pais: String, valor: Int)] = [
        ("Mexico", 213546),
        ("Colombia", 70663),
        ("Argentina", 70369),
        ("Peru", 52825),
        ("Chile", 52122),
        ("Ecuador", 34649),
        ("Bolivia", 32137),
        ("Costa Rica", 22998),
        ("Guatemala", 18612),
        ("Panama", 14899)
    ]
    
    var body: some View {
        VStack {
            Chart {
                ForEach(datos, id: \.pais) { dato in
                    BarMark(
                        x: .value("País", dato.pais),
                        y: .value("Población", dato.valor)
                    )
                }
                
                if mostrar {
                    RuleMark(y: .value("Promedio", 1.5))
                        .foregroundStyle(.gray)
                        .annotation(position: .bottom, alignment: .bottomLeading) {
                            Text("Promedio")
                        }
                }
            }
            .aspectRatio(1, contentMode: .fit)
            
            Toggle(mostrar ? "Ocultar promedio" : "Mostrar promedio", isOn: $mostrar.animation())
                .padding()
            
            VStack(alignment: .leading, spacing: 8) {
                ForEach(datos, id: \.pais) { dato in
                    HStack {
                        Circle()
                            .fill(Color.purple)
                            .frame(width: 8, height: 8)
                        Text("\(dato.pais)")
                        Spacer()
                        Text("\(dato.valor)")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    BarrasView()
}
