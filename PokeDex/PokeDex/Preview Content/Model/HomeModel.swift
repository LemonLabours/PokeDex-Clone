import Foundation

class HomeModel: ObservableObject {
    @Published var searchText = ""
    
    func searchPokemonByName(_ name: String) {
        // Perform the search logic based on the provided name
        // Update the data accordingly
    }
}
