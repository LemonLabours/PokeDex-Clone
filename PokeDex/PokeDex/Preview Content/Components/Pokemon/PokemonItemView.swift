import SwiftUI

struct PokemonItemView: View {
    let pokemon: Pokemon

    var body: some View {
        ZStack{
            Circle()
                .frame(width: 100)
                .foregroundColor(Color(pokemon.color))
                .blur(radius: 30)
                .opacity(0.2)
            VStack {
                Image(pokemon.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150,height: 120)
                    .shadow(radius: 6)
                
                    Text(pokemon.name)
                        .font(.title3)
                        .foregroundColor(.black)
          
            }
          
            
   
        }  .padding(.all,7)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 8)
  
    }
}

struct PokemonItemView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonItemView(pokemon: Pokemon(name: "Pikachu", type: "Electric", description: "Pikachu is an Electric-type Pokémon.", height: "0.4 m", weight: "6.0 kg", image: "pikachu", color: "PElectric"))
    }
}


