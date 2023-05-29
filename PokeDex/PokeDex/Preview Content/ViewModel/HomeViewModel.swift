import SwiftUI

enum Destination {
    case types
    case favoritePokemon
}

class HomeViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var showSheet = false
    @Published var destination: Destination?
    
    private var homeModel = HomeModel()
    
    func navigateToTypesView() {
        destination = .types
        showSheet = true
    }
    
    func navigateToFavoritePokemonView() {
        destination = .favoritePokemon
        showSheet = true
    }
}
