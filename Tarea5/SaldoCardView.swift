//
//  SaldoCardView.swift
//  tarjetas_nav
//
//  Created by Zurisabdai Núñez Velázquez on 27/10/25.
//
import SwiftUI

struct SaldoCardView: View {
    @State private var showingAddFundsSheet = false
    @State private var saldo: Int = 14
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Saldo")
                    .foregroundStyle(Color.white)
                Text("JPY \(saldo)")
                    .fontWeight(.heavy)
                    .foregroundStyle(Color.white)
            }
            Spacer().frame(width: 50)
            
            Button(action: {
                showingAddFundsSheet.toggle()
            }) {
                Text("Añadir saldo")
                    .frame(maxWidth: 150, maxHeight: 40)
                    .background(Color.white)
                    .foregroundColor(.black)
                    .cornerRadius(50)
            }
        }
        .frame(width: 300, height: 100)
        .background(Color.gray)
        .cornerRadius(20)
        .sheet(isPresented: $showingAddFundsSheet) {
            FondosView(saldoActual: $saldo)
        }
    }
}

#Preview {
    SaldoCardView()
}
