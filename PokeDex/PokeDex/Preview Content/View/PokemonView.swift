import SwiftUI

struct PokemonView: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @ObservedObject var viewModel = PokemonViewModel()
    @State private var isActive: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                    ForEach(viewModel.pokemons) { pokemon in
                        NavigationLink(
                            destination: PokemonDetailView(pokemon: pokemon),
                            label: {
                                PokemonItemView(pokemon: pokemon)
                            }
                        )
                    }
                }
                .padding()
            }
            .navigationTitle("Pokemon")
            .onAppear {
                viewModel.loadPokemons()
            }
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        isActive = true
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                        Text("Home")
                            .foregroundColor(.black)
                    }
                    .background(
                        NavigationLink(
                            destination: HomeView(),
                            isActive: $isActive,
                            label: { EmptyView() }
                        )
                        .hidden()
                    )
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView()
    }
}
