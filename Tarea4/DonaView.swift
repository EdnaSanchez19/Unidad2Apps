//
//  DonaView.swift
//  Refactor
//
//  Created by Edna Sanchez  on 27/10/25.
//

import SwiftUI
import Charts

struct DonaView: View {
    
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
            Chart(datos, id: \.pais) { dato in
                SectorMark(
                    angle: .value("Valor", dato.valor),
                    innerRadius: .ratio(0.5),
                    angularInset: 1.5
                )
                .foregroundStyle(by: .value("País", dato.pais))
            }
            .frame(height: 300)
            .chartLegend(.visible)
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

#Preview {
    DonaView()
}
