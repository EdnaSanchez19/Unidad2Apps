//
//  PantallaInicialView.swift
//  Refactor
//
//  Created by Edna Sanchez  on 27/10/25.
//

import SwiftUI

struct PantallaInicialView: View {
        var body: some View {
                NavigationStack {
                    VStack {
                        Text("Graficas")
                            .font(.title)
                            .fontDesign(.serif)
                            .foregroundStyle(.blue)

                        HStack {
                            NavigationLink("Barras") { BarrasView() }
                            NavigationLink("Dona") { DonaView() }
                            NavigationLink("Area") { AreaView() }
                        }
                        .buttonStyle(.bordered)
                    }
                    .padding()
                }
            }
    }

    #Preview {
        PantallaInicialView()
    }
