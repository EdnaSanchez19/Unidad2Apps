//
//  Tarea5.swift
//  Refactor
//
//  Created by Edna Sanchez  on 03/10/25.
//

import AVFoundation
import SwiftUI

struct Tarea5: View {
    @State var etapa = 0
    @State var animando = false
    @State var nombreA = "boo"
    @State var extensionA = "mp3"
    @State var player: AVAudioPlayer?
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Image("castillo1")
                    .resizable()
                    .ignoresSafeArea(edges: .all)
                
                
                Image(obtenerImagenBoo())
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(.trailing, obtenerPosicionX())
                    .padding(.bottom, obtenerPosicionY())
                    .rotation3DEffect(
                        Angle.degrees(obtenerRotacion()),
                        axis: (x: 0, y: 1, z: 0)
                    )
                    .animation(.spring(response: 0.8, dampingFraction: 0.7), value: etapa)
                
                
                Image("mario")
                    .resizable()
                    .frame(width: 100, height: 130)
                    .rotation3DEffect(
                        Angle.degrees(etapa >= 4 ? 180 : 0),
                        axis: (x: 0, y: 1, z: 0)
                    )
                    .padding(.leading, 290)
                    .padding(.top, 320)
                    .animation(.spring(response: 0.6, dampingFraction: 0.7), value: etapa)
                
                
                
                Button(action: {
                    if !animando {
                        iniciarAnimacionCompleta()
                        reproducirSonido(nombreA: "boo", extensionA: "mp3")
                       
            
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
                
                
                Button(action: {
                    etapa = 0
                    animando = false
                }) {
                    Rectangle()
                        .frame(width: 150, height: 80)
                        .foregroundColor(Color(red: 0.898, green: 0.257, blue: 0.418))
                        .cornerRadius(50)
                        .overlay(
                            Text("RESET")
                                .foregroundStyle(Color(red: 0.884, green: 0.874, blue: 0.87))
                                .font(.system(size: 20))
                                .fontDesign(.serif)
                        )
                }
                .foregroundStyle(Color(red: 0.711, green: 0.681, blue: 0.643))
                .padding(.top, 650)
                .padding(.leading, 120)
            }
        }
    }

    

    func iniciarAnimacionCompleta() {
       
        animando = true
        etapa = 0
        
       
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            etapa = 1
        }
        

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.4) {
            etapa = 2
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.1) {
            etapa = 3
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.8) {
            etapa = 4
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
            etapa = 5
            animando = false
        }
    }
    

    func obtenerImagenBoo() -> String {
        if etapa == 0 {
            return "booasustado"
        } else if etapa >= 1 && etapa <= 4 {
            return "booatacando"
        } else {
            return "booasustado"
        }
    }
    

    func obtenerRotacion() -> Double {
        if etapa >= 1 && etapa <= 4 {
            return 180
        } else {
            return 0
        }
    }
    
 
    func obtenerPosicionX() -> CGFloat {
        switch etapa {
        case 0, 1, 2: return 0
        case 3, 4, 5: return 50
        default: return 280
        }
    }
    
 
    func obtenerPosicionY() -> CGFloat {
        switch etapa {
        case 0, 1 ,2: return 400
        case 3, 4 ,5: return 20
        default: return 0
            
        }
    }
    
    func reproducirSonido(nombreA: String, extensionA: String) {
           
        guard let ubicacionSonido = Bundle.main.url(forResource: nombreA, withExtension: extensionA) else {
                    
                    print("No se encontró el archivo de sonido.Revisar este en el proyecto")
                    return
                }
                
                do {
                    player = try AVAudioPlayer(contentsOf: ubicacionSonido)
                    self.player?.play()
                } catch {
                    print("Error al cargar el sonido: \(error)")
                }
            }

        }

#Preview {
    Tarea5()
}
