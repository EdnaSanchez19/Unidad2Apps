//
//  PuntoExtra1.swift
//  Refactor
//
//  Created by Edna Sanchez  on 08/10/25.
//

import SwiftUI
import AVFoundation

struct PuntoExtra1: View {
    
    @State var etapa = 0
    @State var animando = false
    @State var extensionn = "mp3"
    @State var nombre = " "
    @State var player: AVAudioPlayer?
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Image("fondo")
                    .resizable()
                    .ignoresSafeArea()
                    
                Image(systemName: "airplane")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .rotationEffect(.degrees(obtenerRotacion()))
                    .offset(x: obtenerPosicionX(), y: obtenerPosicionY())
                    .animation(.spring(response: 0.8, dampingFraction: 0.7), value: etapa)
                
                Button(action: {
                    if !animando {
                        iniciarAnimacionCompleta()
                        reproducirSonido(nombre: "despegando", extensionn: "mp3")
                    }
                }) {
                    Rectangle()
                        .frame(width: 150, height: 80)
                        .foregroundColor(
                            animando
                            ? Color.gray
                            : Color(hue: 0.631, saturation: 0.769, brightness: 0.858)
                        )
                        .cornerRadius(50)
                        .overlay(
                            Text("ANIMACIÓN")
                                .foregroundStyle(Color(red: 0.0, green: 0.0, blue: 0.004))
                                .font(.system(size: animando ? 16 : 20))
                                .fontDesign(.serif)
                        )
                }
                .disabled(animando)
                .foregroundStyle(Color(red: 0.711, green: 0.681, blue: 0.643))
                .padding(.top, 650)
                .padding(.trailing, 200)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    
    func iniciarAnimacionCompleta() {
        animando = true
        etapa = 0
        
        // despegue
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.0) {
            etapa = 1
        }
        
        // despegando
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            etapa = 2
        }
        
        // volando
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            etapa = 3
        }
        
        // aterriza
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            etapa = 4
        }
        
        // baja
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            etapa = 5
        }
        
        // piso
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            etapa = 6
            animando = false
            player?.stop()
        }
    }
    

        func obtenerRotacion() -> Double {
            switch etapa {
            case 0: return 0
            case 1: return -40
            case 2: return -30
            case 3: return -25
            case 4: return 20
            case 5: return 30
            case 6: return 15
            default: return 0
            }
        }
    
    
    // horizontal
    func obtenerPosicionX() -> CGFloat {
        switch etapa {
        case 0, 1: return -150
        case 2: return -50
        case 3: return 50
        case 4: return 100
        case 5: return 130
        case 6: return 150
        default: return -150
        }
    }
    
    // vertical
    func obtenerPosicionY() -> CGFloat {
        switch etapa {
        case 0, 1: return 200
        case 2: return 50
        case 3: return -100
        case 4: return -80
        case 5: return 50
        case 6: return 200
        default: return 200
        }
    }
    
    func reproducirSonido(nombre: String, extensionn: String) {
        guard let ubicacionSonido = Bundle.main.url(forResource: nombre, withExtension: extensionn) else {
            print("No se encontró el archivo de sonido. Revisar este en el proyecto")
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: ubicacionSonido)
            self.player?.play()
        } catch {
            print("Error al cargar el sonido: \(error)")
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            PuntoExtra1()
        }
    }
}


#Preview {
    PuntoExtra1()
}
