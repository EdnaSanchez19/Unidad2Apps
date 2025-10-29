//
//  CinepolisView.swift
//  Refactor
//
//  Created by Edna Sanchez  on 27/10/25.
//

import SwiftUI
import AVFoundation

struct CinepolisView: View {
    @State private var player: AVAudioPlayer?
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                Button(action: {
        
                }) {
                    NavigationLink(destination: ProductCardView(valores:
                                                                    [ ("Combo Clásico", "combo1"),
                                                                      ("Combo Nachos", "combo2"),
                                                                      ("Combo Junior", "combo3"),
                                                                      ("Combo Cornetto", "combo4") ])) {
                        CardView(name: "Combos", imagen: "combos")
                    }
                }.simultaneousGesture(TapGesture().onEnded {
                    reproducirSonido(nombreArchivo: "popcorn", extensionArchivo: "mp3")
                })
                Button(action: {
                
                }) {
                    NavigationLink(destination: ProductCardView(valores:
                                                                    [ ("Jumbo", "palomitas1"),
                                                                      ("Grandes", "palomitas2"),
                                                                      ("Medianas", "palomitas3"),
                                                                      ("Chicas", "palomitas4") ])) {
                        CardView(name: "Palomitas", imagen: "palomitas")
                    }
                }.simultaneousGesture(TapGesture().onEnded {
                    reproducirSonido(nombreArchivo: "chewing", extensionArchivo: "mp3")
                })
                Button(action: {
                    
                }) {
                    NavigationLink(destination: ProductCardView(valores:
                                                                    [ ("Coco Cola Original", "bebida1"),
                                                                      ("Fuzetea", "bebida2"),
                                                                      ("Sprite", "bebida3"),
                                                                      ("Coca Cola sin Azúcar", "bebida4") ])) {
                        CardView(name: "Bebidas", imagen: "refrescos")
                    }
                }.simultaneousGesture(TapGesture().onEnded {
                    reproducirSonido(nombreArchivo: "refresco", extensionArchivo: "mp3")
                })
                Button(action: {
                    
                }) {
                    NavigationLink(destination: ProductCardView(valores:
                                                                    [ ("Nachos", "snacks"),
                                                                      ("Hot Dog Takis", "snack1"),
                                                                      ("Boneless", "snack2"),
                                                                      ("Papas fritas", "snack3") ])) {
                        CardView(name: "Snacks", imagen: "snacks")
                    }
                }.simultaneousGesture(TapGesture().onEnded {
                    reproducirSonido(nombreArchivo: "chips", extensionArchivo: "mp3")
                })
                Button(action: {
                    
                }) {
                    NavigationLink(destination: ProductCardView(valores:
                                                                    [ ("Helado Oreo", "helados"),
                                                                      ("Cornetto", "helado1"),
                                                                      ("Magnum", "helado2"),
                                                                      ("Pastel de Chocolate(Rebanada)", "helado3") ])) {
                        CardView(name: "Postres y Helados", imagen: "postres")
                    }
                }.simultaneousGesture(TapGesture().onEnded {
                    reproducirSonido(nombreArchivo: "ice", extensionArchivo: "mp3")
                })
                Button(action: {
                    
                }) {
                    NavigationLink(destination: ProductCardView(valores:
                                                                    [ ("m&m's", "dulces"),
                                                                      ("Skwinhles Chunks (Sandía)", "dulce1"),
                                                                      ("Skwinhles Chunks (Mango)", "dulce2"),
                                                                      ("Salvavidas", "dulce3") ])) {
                        CardView(name: "Dulces", imagen: "dulces")
                    }
                }.simultaneousGesture(TapGesture().onEnded {
                    reproducirSonido(nombreArchivo: "candy", extensionArchivo: "mp3")
                })
            }
        }
    }
    func reproducirSonido(nombreArchivo: String, extensionArchivo: String) {
        
        let nombreArchivo: String = nombreArchivo
        let extensionArchivo: String = extensionArchivo
        
        guard let ubicacionSonido = Bundle.main.url(forResource: nombreArchivo, withExtension: extensionArchivo)
        else {
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
    CinepolisView()
}
