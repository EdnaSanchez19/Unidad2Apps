//
//  PuntoExtra2.swift
//  Refactor
//
//  Created by Edna Sanchez  on 23/10/25.
//

import SwiftUI
import AVFoundation

struct PuntoExtra2: View {
    
    @State var etapa = 0
    @State var animando = false
    @State var extensionn = "mp3"
    @State var nombre = " "
    @State var player: AVAudioPlayer?
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Image("mar")
                    .resizable()
                    .ignoresSafeArea()
                    
                Image("submarino")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .rotationEffect(.degrees(obtenerRotacion()))
                    .offset(x: obtenerPosicionX(), y: obtenerPosicionY())
                    .animation(.spring(response: 0.8, dampingFraction: 0.7), value: etapa)
                
                Button(action: {
                    if !animando {
                        iniciarAnimacionCompleta()
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
        
        // sumergiendo
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.0) {
            etapa = 1
            reproducirSonido(nombre: "splash", extensionn: "mp3")
        }
        
        // bajando
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            etapa = 2
        }
        
        // nadando
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.4) {
            etapa = 3
            reproducirSonido(nombre: "submarino", extensionn: "mp3")
        }
        
        // emerge
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.1) {
            etapa = 4
        }
        
        // sube
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.8) {
            etapa = 5
            reproducirSonido(nombre: "bajoagua", extensionn: "mp3")
        }
        
        // afuera
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.8) {
            etapa = 6
            animando = false
            player?.stop()
        }
    }
    

        func obtenerRotacion() -> Double {
            switch etapa {
            case 0: return 0
            case 1: return 80
            case 2: return 40
            case 3: return 0
            case 4: return -30
            case 5: return -80
            case 6: return -40
            default: return 0
            }
        }
    
    
    // horizontal
    func obtenerPosicionX() -> CGFloat {
        switch etapa {
        case 0: return -150
        case 1: return -100
        case 2: return -55
        case 3: return 0
        case 4: return 55
        case 5: return 99
        case 6: return 160
        default: return 0
        }
    }
   

    // vertical
    func obtenerPosicionY() -> CGFloat {
        switch etapa {
        case 0: return 0
        case 1: return 100
        case 2: return 150
        case 3: return 200
        case 4: return 130
        case 5: return 90
        case 6: return 0
        default: return 0
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
            PuntoExtra2()
        }
    }
}


#Preview {
    PuntoExtra2()
}
