//
//  ShfDbzViewNo.swift
//  SHFList
//
//  Created by Ronaldo Rendón Loja on 22/1/24.
//

import SwiftUI

struct ShfDbzViewNo: View {
    
    let isAcquired: Bool
        
    init(isAcquired: Bool) {
        self.isAcquired = isAcquired
    }
    
    @Environment(\.presentationMode) var presentationMode
 
    let characters = [
        Character(name: .android21, description: "Androide N 21"),
        Character(name: .shenron, description: "Shenlon"),
        Character(name: .piccolo, description: "Piccolo"),
        Character(name: .piccoloNamekiano, description: "Piccolo Orgulloso Namekiano"),
        Character(name: .brolyMamado, description: "Broly"),
        Character(name: .gokuSSJ2, description: "Goku Super Sayayin 2"),
        Character(name: .andoid16, description: "Androide N 16"),
        Character(name: .gokuSSGSS, description: "Goku Super Sayayin Dios Super Sayayin"),
        Character(name: .whis, description: "Whis"),
        Character(name: .beerus, description: "Bills"),
        Character(name: .android18, description: "Androide N 18"),
        Character(name: .android17, description: "Androide N 17"),
        Character(name: .gokuUI, description: "Goku Ultra Instinto"),
        Character(name: .brolyDBZ, description: "Broly DBZ"),
        Character(name: .gohanBestia, description: "Gohan Bestia"),
        Character(name: .brolyDBS, description: "Broly DBS"),
        Character(name: .pan, description: "Pan"),
        Character(name: .gamma2, description: "Gamma 2"),
        Character(name: .gamma1, description: "Gamma 1"),
        Character(name: .porunga, description: "Porunga y Dende"),
        Character(name: .kidGohanNamek, description: "Gohan battle damaged"),
        Character(name: .zarbon, description: "Zarbon"),
        Character(name: .dodoria, description: "Dodoria"),
        Character(name: .kefla, description: "Kefla"),
        Character(name: .bulmaNamek, description: "Bulma Namek"),
        Character(name: .tenshinhan, description: "Tenshinhan y Chaos"),
        Character(name: .launch, description: "Launch"),
        Character(name: .hit, description: "Hit"),
        Character(name: .burterGuldo, description: "Burter y Guildo"),
        Character(name: .recoome, description: "Recoome"),
        Character(name: .jeice, description: "Jeice"),
        Character(name: .zamasu, description: "Zamasu"),
        Character(name: .kidGohan, description: "Gohan Niño"),
        Character(name: .vegitoSSGSS, description: "Vegito SSGSS"),
        Character(name: .jirenMamado, description: "Jiren Mamado"),
        Character(name: .kidChichi, description: "Chichi Kid"),
        Character(name: .mono, description: "Ozaru Vegeta"),
        Character(name: .ginyu, description: "Capitan Ginyu"),
        Character(name: .gokuKaoihken, description: "Goku Kaiohken"),
        Character(name: .jiren, description: "Jiren"),
        Character(name: .piccoloDauimaoh, description: "Piccolo Daimakoh"),
        Character(name: .brolyArmor, description: "Broly Armadura DBS"),
        Character(name: .zamasuPotara, description: "Zamasu Fusion"),
        Character(name: .android21Buu, description: "Androide N 21 Buu"),
        Character(name: .kidKrillin, description: "Krillin Kid"),
        Character(name: .gotenks, description: "Gotenks SSJ"),
        Character(name: .bulmaCafe, description: "Bulma"),
        Character(name: .yamcha, description: "Yamcha"),
        Character(name: .vegetaScooter, description: "Vegeta Scooter"),
        Character(name: .cellPremiumColor, description: "Cell"),
        Character(name: .teenGohanDamaged, description: "Gohan daño de batalla"),
        Character(name: .broly2014, description: "Broly Mamado")

    ]

    let charactersPerPage = 3
        
        var paginatedCharacters: [[Character]] {
            characters.chunked(into: charactersPerPage)
        }

        @State private var currentPage = 0

        var body: some View {
            VStack {
                // Mostrar el número total de figuras en la parte superior
                Text("Total de Figuras: \(characters.count)")
                    .font(.system(size: 18))
                    .padding(.top, 10)
                    .foregroundColor(Color("TextColor"))

                ForEach(paginatedCharacters[currentPage], id: \.name) { character in
                    VStack {
                        Text("\(character.description)")
                            .font(.system(size: 18))
                            .foregroundColor(.gray)
                        if let imageUrl = character.imageURL() {
                            AsyncImage(url: imageUrl) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                case .success(let image):
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 210.0)
                                        .padding(.trailing, 10)
                                case .failure:
                                    Text("Error al cargar la imagen")
                                        .foregroundColor(Color("TextColor"))
                                @unknown default:
                                    EmptyView()
                                }
                            }
                        }
                    }
                    Divider() // Agrega un separador entre cada Figura DBZ
                }

                HStack {
                    // Botón para retroceder de página
                    Button(action: {
                        withAnimation {
                            currentPage = (currentPage - 1 + paginatedCharacters.count) % paginatedCharacters.count
                        }
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.blue)
                            .font(.headline)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 2))
                    }
                    
                    Spacer()
                    
                    // Texto para mostrar el número de página actual
                    Text("Página \(currentPage + 1) de \(paginatedCharacters.count)")
                        .font(.system(size: 18))
                        .padding(.horizontal, 20)
                        .foregroundColor(Color("TextColor"))
                        
                    Spacer()
                    
                    // Botón para ir a la siguiente página
                    Button(action: {
                        withAnimation {
                            currentPage = (currentPage + 1) % paginatedCharacters.count
                        }
                    }) {
                        Image(systemName: "chevron.right")
                            .foregroundColor(.blue)
                            .font(.headline)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 2))
                    }
                }
                .padding(.bottom, 10) // Ajuste del espacio en la parte inferior
            }
            .padding()
            .navigationTitle("SHFiguartsDBZ Ronny")
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.blue)
                        .font(.headline)
                        .padding(.trailing, 0)  // Ajusta el espaciado aquí
                    Text("Menú")
                }
            })
        }
    }

struct ShfDbzViewNo_Previews: PreviewProvider {
    static var previews: some View {
        ShfDbzViewNo(isAcquired: false)
    }
}
