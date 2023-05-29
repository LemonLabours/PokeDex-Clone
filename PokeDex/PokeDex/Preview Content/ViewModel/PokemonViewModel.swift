
import SwiftUI
class PokemonViewModel: ObservableObject {
    @Published var pokemons: [Pokemon] = []
    @Published var error: Error?
    
    init() {
        loadPokemons()
    }
    
    func loadPokemons() {
        if let fileURL = Bundle.main.url(forResource: "pokemonData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileURL)
                decodePokemons(from: data)
            } catch {
                DispatchQueue.main.async {
                    self.error = error
                }
            }
        } else {
            DispatchQueue.main.async {
                self.error = NSError(domain: "File not found", code: -1, userInfo: nil)
            }
        }
    }
    
    func decodePokemons(from data: Data) {
        let decoder = JSONDecoder()
        do {
            self.pokemons = try decoder.decode([Pokemon].self, from: data)
            self.error = nil
        } catch {
            self.error = error
        }
    }
    
    func addPokemon(pokemon: Pokemon) {
        pokemons.append(pokemon)
        savePokemonsToFile()
    }
    
    func deletePokemon(pokemon: Pokemon) {
        if let index = pokemons.firstIndex(where: { $0.id == pokemon.id }) {
            pokemons.remove(at: index)
            savePokemonsToFile()
        }
    }
    
    func savePokemonsToFile() {
        if let fileURL = Bundle.main.url(forResource: "pokemonData", withExtension: "json") {
            do {
                let encoder = JSONEncoder()
                let data = try encoder.encode(pokemons)
                try data.write(to: fileURL, options: .atomic)
            } catch {
                DispatchQueue.main.async {
                    self.error = error
                }
            }
        } else {
            DispatchQueue.main.async {
                self.error = NSError(domain: "File not found", code: -1, userInfo: nil)
            }
        }
    }
}
