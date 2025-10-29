//
//  TransaccionCardView.swift
//  tarjetas_nav
//
//  Created by Edna Sanchez on 27/10/25.
//

import SwiftUI

struct TransaccionCardView: View {
    var image: String
    var name: String
    var subtitle: String
    var date: String
    var income: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: image)
                .resizable()
                .scaledToFit()
                .frame(width: 28, height: 28)
                .foregroundColor(.white)
                .padding(10)
                .background(Color.blue)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(name)
                        .font(.headline)
                        .lineLimit(1)
                    Spacer()
                    Text(income)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }
                
                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .lineLimit(1)
                
                Text(date)
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
            
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
                .font(.caption)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

#Preview {
    TransaccionCardView(image: "bus", name: "Transporte",subtitle:"De shinagawa Station",date: "22/07/25", income: "JPY 1,616")
}
