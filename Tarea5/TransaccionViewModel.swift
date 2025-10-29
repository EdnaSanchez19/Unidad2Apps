//
//  TransaccionViewModel.swift
//  tarjetas_nav
//
//  Created by Edna Sanchez on 27/10/25.
//

import SwiftUI

struct TransaccionViewModel{
    
    func dummyData() -> [Transaccion] {
        
        var gasto: [Transaccion] = [
            Transaccion(id: 1, image: "bus", name: "Transporte",subtitle:"De shinagawa Station",date: "22/07/25", income: "JPY 1,616"),
            Transaccion(id: 2, image: "bus", name: "Transporte",subtitle:"De shinagawa Station",date: "22/07/25", income: "JPY 1,616"),
            Transaccion(id: 3, image: "bus", name: "Transporte",subtitle:"De shinagawa Station",date: "22/07/25", income: "JPY 1,616"),
            Transaccion(id: 4, image: "bus", name: "Transporte",subtitle:"De shinagawa Station",date: "22/07/25", income: "JPY 1,616"),
            Transaccion(id: 5, image: "bus", name: "Transporte",subtitle:"De shinagawa Station",date: "22/07/25", income: "JPY 1,616")
        
        
        ]

   

        return gasto
    }
}
