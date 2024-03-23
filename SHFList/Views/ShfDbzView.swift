import SwiftUI


struct ShfDbzView: View {
    
    let isAcquired: Bool
        
    init(isAcquired: Bool) {
        self.isAcquired = isAcquired
    }
    
    @Environment(\.presentationMode) var presentationMode
 
    let characters = [
        Character(name: .trunksSSJ, description: "Future Trunks SSJ"),
        Character(name: .gokuSSJ, description: "Super Saiyan Son Goku"),
        Character(name: .frezeerSecond, description: "Frieza Second Form"),
        Character(name: .turles, description: "Turles"),
        Character(name: .vegetaSSJ4, description: "Super Saiyan 4 Vegeta"),
        Character(name: .gohanTeen, description: "Super Saiyan Son Gohan"),
        Character(name: .broly, description: "Broly Fullpower"),
        Character(name: .cooler, description: "Cooler Final Form"),
        Character(name: .piccoloOrange, description: "Orange Piccolo"),
        Character(name: .trunksAboy, description: "Super Saiyan Trunks ‘Boy from the Future’"),
        Character(name: .vegetaSSJ, description: "Super Saiyan Vegeta ‘Awakening Super Saiyan Blood’"),
        Character(name: .krillinNamek, description: "Krillin ‘Battle Clothes’"),
        Character(name: .cell, description: "Cell ‘First Form’"),
        Character(name: .booGordo, description: "Majin Buu -Good-"),
        Character(name: .gohanDBS, description: "Ultimate Gohan Super Hero"),
        Character(name: .vegetaDBS, description: "Vegeta Super Hero"),
        Character(name: .frezzerCuarta, description: "Frieza Fourth Form"),
        Character(name: .krillin, description: "Krillin «Earth’s Strongest Man»"),
        Character(name: .gokuSSJ4, description: "Super Saiyan 4 Son Goku"),
        Character(name: .gokuBlack, description: "Goku Black Super Saiyan Rose"),
        Character(name: .gokuKawai, description: "Super Saiyan Full Power Son Goku"),
        Character(name: .gokuGod, description: "Super Saiyan God Son Goku"),
        Character(name: .nappa, description: "Nappa"),
        Character(name: .frezzerPrimera, description: "Frieza First Form & Frieza Pod"),
        Character(name: .bardock, description: "Bardock"),
        Character(name: .roshiChun, description: "Jackie Chun"),
        Character(name: .taoPaiPai, description: "Tao Pai Pai"),
        Character(name: .bulmaKid, description: "Bulma Adventure Begins"),
        Character(name: .gokuBlue, description: "SSGSS Son Goku"),
        Character(name: .gogeta, description: "SSGSS Gogeta"),
        Character(name: .booFlaco, description: "Majin Boo (Evil)"),
        Character(name: .roshi, description: "Kame Sennin (Master Roshi)"),
        Character(name: .gokuBase, description: "Son Goku (a Saiyan Raised on Earth)"),
        Character(name: .gokuKid, description: "Son Goku (Kid)"),
        Character(name: .gokuFrezzer, description: "Super Saiyan Son Goku (Super Warrior Awakening)"),
        Character(name: .gokuSSJ3, description: "Super Saiyan 3 Son Goku"),
        Character(name: .granSayaman, description: "Gran Saiyaman"),
        Character(name: .mrSatan, description: "Mr. Satan"),
        Character(name: .frezzerTercera, description: "Frezzer Tercera Forma"),
        Character(name: .android19, description: "Androide 19"),
        Character(name: .metalCooler, description: "Metal Cooler"),
        Character(name: .gokuMamado, description: "Goku Mamado"),
        Character(name: .gohanSSJ2, description: "Gohan Super Saiyan 2"),
        Character(name: .raditzGohan, description: "Raditz y Gohan"),
        Character(name: .majinVegeta, description: "Majin Vegeta"),
        Character(name: .vegeta24000, description: "Vegeta 24000 de poder"),
        Character(name: .spiderman, description: "El Hombre que araña")
    ]

    let charactersPerPage = 2
        
        var paginatedCharacters: [[Character]] {
            characters.chunked(into: charactersPerPage)
        }

        @State private var currentPage = 0
        @State private var direction: Int = 0

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
                                @unknown default:
                                    EmptyView()
                                }
                            }
                        }
                    }
                    .transition(.asymmetric(insertion: .move(edge: direction == 1 ? .trailing : .leading), removal: .move(edge: direction == 1 ? .leading : .trailing)))
                    Divider() // Agrega un separador entre cada Figura DBZ
                }

                HStack {
                    // Botón para retroceder de página
                    Button(action: {
                        withAnimation {
                            direction = -1 // Retroceder
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
                        .foregroundColor(.black)
                        .padding(.horizontal, 20)
                        
                    Spacer()
                    
                    // Botón para ir a la siguiente página
                    Button(action: {
                        withAnimation {
                            direction = 1 // Avanzar
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



extension Array {
    // Función de extensión para dividir el array en subarrays del tamaño dado
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}


struct ShfDbzView_Previews: PreviewProvider {
    static var previews: some View {
        ShfDbzView(isAcquired: true)
    }
}


