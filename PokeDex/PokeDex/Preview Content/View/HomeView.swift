import SwiftUI

struct HomeView: View {
    
    @ObservedObject private var viewModel = HomeViewModel()
    
    @State private var selection: String? = nil
    
    var body: some View {
        NavigationView {
            ZStack {
                OutwardCurvedRectangleDemo()
                
                VStack {
                    Spacer()
                        .frame(height: 400)
                    VStack(spacing: 10) {
                   
  
                        ButtonView(title: "Pokemons", imageName: "circle.circle.fill", backgroundColor: .PDragon, destination: PokemonView())
                        ButtonView(title: "Management", imageName: "heart.fill", backgroundColor: .PFairy, destination: PokemonManagementView())
  
                        
                        
                
                    }
                    .padding()
                }
            }
         
        } .navigationBarBackButtonHidden(true)
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
