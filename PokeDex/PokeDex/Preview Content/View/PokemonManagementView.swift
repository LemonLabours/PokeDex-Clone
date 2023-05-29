import SwiftUI

struct PokemonManagementView: View {
    @ObservedObject private var viewModel = PokemonViewModel()
    @State private var newPokemonName = ""
    @State private var newPokemonType = ""
    @State private var newPokemonImage = ""
    @State private var newPokemonDescription = ""
    @State private var newPokemonHeight = ""
    @State private var newPokemonWeight = ""
    @State private var newPokemonColor = ""
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("New Pokémon")) {
                    TextField("Name", text: $newPokemonName)
                    TextField("Type", text: $newPokemonType)
                    TextField("Image", text: $newPokemonImage)
                    TextField("Description", text: $newPokemonDescription)
                    TextField("Height", text: $newPokemonHeight)
                    TextField("Weight", text: $newPokemonWeight)
                    TextField("Color", text: $newPokemonColor)
                    
                    Button(action: {
                        let pokemon = Pokemon(name: newPokemonName,
                                              type: newPokemonType,
                                              description: newPokemonDescription,
                                              height: newPokemonHeight,
                                              weight: newPokemonWeight,
                                              image: newPokemonImage,
                                              color: newPokemonColor)
                        viewModel.addPokemon(pokemon: pokemon)
                        clearNewPokemonFields()
                    }) {
                        Text("Add Pokémon")
                    }
                }
            }
            
            List(viewModel.pokemons) { pokemon in
                HStack {
                    Image(pokemon.image)
                        .resizable()
                        .frame(width: 50, height: 50)
                    
                    VStack(alignment: .leading) {
                        Text(pokemon.name)
                            .font(.title)
                        Text(pokemon.type)
                            .font(.subheadline)
                        
                        Button(action: {
                            viewModel.deletePokemon(pokemon: pokemon)
                        }) {
                            Text("Delete")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
        }
        .onAppear {
            viewModel.loadPokemons()
        }
    }
    
    private func clearNewPokemonFields() {
        newPokemonName = ""
        newPokemonType = ""
        newPokemonImage = ""
        newPokemonDescription = ""
        newPokemonHeight = ""
        newPokemonWeight = ""
        newPokemonColor = ""
    }
}

struct PokemonManagementView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonManagementView()
    }
}
