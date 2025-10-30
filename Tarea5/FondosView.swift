//
//  FondosView.swift
//  tarjetas_nav
//
//  Created by Edna Sanchez on 27/10/25.
//

import SwiftUI

struct FondosView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var saldoActual: Int
    @State var amount: Int = 0
    
    var body: some View {
        VStack {
            HStack {
                Button("Cancelar") {
                    dismiss()
                }
                Spacer()
                Text("Añadir saldo")
                    .font(.headline)
                Spacer()
                Button("Añadir") {
                    saldoActual += amount
                    amount = 0
                    dismiss()
                }
                .disabled(amount == 0)
                .opacity(amount == 0 ? 0.5 : 1)
            }
            .padding()
            
            Spacer().frame(height: 20)
            
            TarjetaView(nombre: "BBVA", numero: "123456789", cliente: "Edna Sanchez")
                .frame(width: 250, height: 140)
                .padding(.bottom, 30)
            
            VStack(spacing: 8) {
                Text("JPY")
                    .font(.title3)
                    .foregroundColor(.gray)
                Text("\(amount)")
                    .font(.system(size: 48, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                Text("Saldo actual JPY \(saldoActual)")
                    .foregroundColor(.gray)
            }
            .padding(.bottom, 40)
            
            VStack(spacing: 10) {
                HStack(spacing: 10) {
                    TecladoBoton(title: "JPY 1,000") { amount += 1000 }
                    TecladoBoton(title: "JPY 2,000") { amount += 2000 }
                    TecladoBoton(title: "JPY 1,309") { amount += 1309 }
                }
                .padding(.bottom, 10)
                
                ForEach([[1,2,3],[4,5,6],[7,8,9]], id: \.self) { row in
                    HStack(spacing: 10) {
                        ForEach(row, id: \.self) { num in
                            TecladoBoton(title: "\(num)") {
                                amount = amount * 10 + num
                            }
                        }
                    }
                }
                
                HStack(spacing: 10) {
                    Spacer()
                    TecladoBoton(title: "0") {
                        amount = amount * 10
                    }
                    TecladoBoton(title: "⌫") {
                        amount /= 10
                    }
                }
            }
            .padding(.horizontal, 30)
            .padding(.bottom, 30)
            
            Spacer()
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

struct TecladoBoton: View {
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .frame(maxWidth: .infinity, minHeight: 50)
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.white)
                .background(Color(white: 0.15))
                .cornerRadius(10)
        }
    }
}

#Preview {
    FondosView(saldoActual: .constant(14))
}
