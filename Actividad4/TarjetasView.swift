//
//  TarjetasView.swift
//  Refactor
//
//  Created by Edna Sanchez  on 27/10/25.
//

import SwiftUI

struct TarjetasView: View {
        @State var cardSeleccionada: Int
        @State private var deshabilitar: Bool = false
        @State var pressedPadre: Bool = false
        @State private var showAlert: Bool = false  // Estado para mostrar la alerta
        @State private var bancoSeleccionado: String = ""  // Almacenar el nombre del banco

        var body: some View {
            VStack {
                // groupbox de las tarjetas descongeladas
                if deshabilitar {
                    GroupBox(label: Text("Tarjetas congeladas").font(.headline).foregroundColor(.red)) {
                        Text("Las tarjetas están deshabilitadas.")
                            .foregroundColor(.gray)
                    }
                    .padding()
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    TarjetasViewModel(id: 1, nombre: "BBVA", number: "4152 4593 9901 8870", color: .blue, pressed: $pressedPadre, selectedIndex: $cardSeleccionada, deshabilitar: deshabilitar, showAlert: $showAlert, bancoSeleccionado: $bancoSeleccionado)
                    TarjetasViewModel(id: 2, nombre: "Santander", number: "4152 4593 9901 8870", color: .green, pressed: $pressedPadre, selectedIndex: $cardSeleccionada, deshabilitar: deshabilitar, showAlert: $showAlert, bancoSeleccionado: $bancoSeleccionado)
                    TarjetasViewModel(id: 3, nombre: "Nu", number: "4152 4593 9901 8870", color: .purple, pressed: $pressedPadre, selectedIndex: $cardSeleccionada, deshabilitar: deshabilitar, showAlert: $showAlert, bancoSeleccionado: $bancoSeleccionado)
                    TarjetasViewModel(id: 4, nombre: "Banorte", number: "4152 4593 9901 8870", color: .orange, pressed: $pressedPadre, selectedIndex: $cardSeleccionada, deshabilitar: deshabilitar, showAlert: $showAlert, bancoSeleccionado: $bancoSeleccionado)
                    TarjetasViewModel(id: 5, nombre: "Scotiabank", number: "4152 4593 9901 8870", color: .red, pressed: $pressedPadre, selectedIndex: $cardSeleccionada, deshabilitar: deshabilitar, showAlert: $showAlert, bancoSeleccionado: $bancoSeleccionado)
                }
                .overlay(
                    VStack {
                        Toggle(" ", isOn: $deshabilitar)
                            .padding()
                    }
                    , alignment: .top
                )
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Método Preferido Establecido"),
                          message: Text("Tarjeta de \(bancoSeleccionado) ha sido establecido como método preferido de pago exitosamente."),
                          dismissButton: .default(Text("OK")))
                }
            }
        }
    }

    struct TarjetasViewModel: View {
        @State var id: Int
        @State var nombre: String
        @State var number: String
        @State var color: Color
        @Binding var pressed: Bool
        @Binding var selectedIndex: Int
        var deshabilitar: Bool
        @Binding var showAlert: Bool  // Para mostrar la alerta
        @Binding var bancoSeleccionado: String  // Para almacenar el nombre del banco seleccionado
        
        func labelPresionado() -> String {
            if selectedIndex == id {
                return "star.fill"
            } else {
                return "star"
            }
        }
        
        var body: some View {
            Rectangle()
                .TarjetaStyle()
                .foregroundStyle(deshabilitar ? Color.gray : color)
                .overlay(
                    VStack() {
                        Button(action: {
                            if !deshabilitar {
                                pressed.toggle()
                                self.selectedIndex = self.id
                                self.bancoSeleccionado = nombre  // Asignar el nombre del banco a la variable
                                showAlert = true  // Mostrar la alerta cuando se cambia el icono
                            }
                        }) {
                            Image(systemName: labelPresionado())
                                .foregroundStyle(Color.white)
                        }
                        
                        Text(nombre)
                            .bold(true)
                            .padding(.bottom, 30)
                            .font(.title2)
                        Text(number)
                            .font(Font.title2.bold())
                    }
                )
                .opacity(deshabilitar ? 0.5 : 1)
                .disabled(deshabilitar)
        }
    }

    #Preview {
        TarjetasView(cardSeleccionada: 0)
    }
