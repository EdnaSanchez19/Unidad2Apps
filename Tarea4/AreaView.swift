//
//  AreaView.swift
//  Refactor
//
//  Created by Edna Sanchez  on 27/10/25.
//

import SwiftUI
import Charts

struct AreaView: View {
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

    var promedio: Double {
        let suma = datos.reduce(0) { $0 + $1.valor }
        return Double(suma) / Double(datos.count)
    }

    var body: some View {
        VStack {
            Chart {
                ForEach(datos, id: \.pais) { dato in
                    AreaMark(
                        x: .value("País", dato.pais),
                        y: .value("Población", dato.valor)
                    )
                    .interpolationMethod(.catmullRom) // suaviza (opcional)
                    .foregroundStyle(.blue.opacity(0.4))
                }

                if mostrar {
                    RuleMark(y: .value("Promedio", promedio))
                        .foregroundStyle(.gray)
                        .lineStyle(StrokeStyle(lineWidth: 2, dash: [6, 6]))
                        .annotation(position: .topLeading) {
                            Text("Promedio: \(Int(promedio))")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                }
            }
            .aspectRatio(1, contentMode: .fit)
            .animation(.default, value: mostrar)

            Toggle(mostrar ? "Ocultar promedio" : "Mostrar promedio", isOn: $mostrar)
                .padding()

            // Lista auxiliar (opcional)
            VStack(alignment: .leading, spacing: 8) {
                ForEach(datos, id: \.pais) { dato in
                    HStack {
                        Circle()
                            .fill(Color.purple)
                            .frame(width: 8, height: 8)
                        Text(dato.pais)
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

#Preview { AreaView() }
