import SwiftUI


struct PokemonDetailView: View {
    let pokemon: Pokemon
    var body: some View {
        ScrollView{
            ZStack {
              
                GeometryReader { geometry in
                    OutwardCurvedRectangle(cornerRadius: 20)
                        .fill(Color(pokemon.color))
                        .frame(width: geometry.size.width)
                        .frame(height: 480) // Adjust the height as needed
                }
                
                Image(systemName: "circle.circle")
                    .font(Font.system(size: 320))
                    .foregroundColor(.white) // Change the color to white
                    .bold()
                    .opacity(0.2) // Apply opacity (0.0 to 1.0)
                    .padding(.bottom, 280)
                
                Circle()
                    .frame(width: 200)
                    .foregroundColor(Color(pokemon.color))
                    .blur(radius: 100)
                    .opacity(0.8)
                
                HStack {
                    Spacer()
                        .frame(width: 50)
                    Image(systemName: "circle.circle")
                        .bold()
                        .foregroundColor(Color.black)
                        .font(.title)
                    Text(pokemon.name)
                        .bold()
                        .foregroundColor(Color.black)
                        .font(.largeTitle)
                    Spacer()
                }
                .padding(.bottom, 660)
                
                Image(pokemon.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 340, maxHeight: 300)
                    .padding(.bottom, 240)
                
                VStack(spacing: 10) {
                    Text(pokemon.type)
                        .font(.title3)
                        .foregroundColor(.white)
                        .shadow(radius: 8)
                        .bold()
                        .padding(.all, 10)
                        .background(Color(pokemon.color))
                        .cornerRadius(8)
                        .shadow(radius: 4)
                    
                    Text(pokemon.description)
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding()
                        .cornerRadius(8)
                    
                    HStack {
                        Text("Height: \(pokemon.height)")
                            .font(.headline)
                            .foregroundColor(.white)
                            .bold()
                            .padding()
                            .background(Color.gray.opacity(0.9))
                            .cornerRadius(8)
                            .shadow(radius: 4)
                        
                        Text("Weight: \(pokemon.weight)")
                            .font(.headline)
                            .foregroundColor(.white)
                            .bold()
                            .padding()
                            .background(Color.gray.opacity(0.9))
                            .cornerRadius(8)
                    }
                    .shadow(radius: 4)
                    
                }
                .padding(.top, 300)
                .padding(.horizontal, 20)
                
                VStack {
                  
                    HStack {
                        Spacer()
                        NavigationLink(destination: PokemonView()) {
                            VStack {
                                Spacer()
                                    .frame(height: 720)
                                Image("PokeDex")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                Text("Back To Pokedex")
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 20)
                        Spacer()
                    }
                    .padding(.bottom, 20)
                }
            }
       
        }     .navigationBarBackButtonHidden()
            .ignoresSafeArea()
    }

}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemon: Pokemon(name: "Pikachu", type: "Electric", description: "When several of these Pokémon gather, their electricity could build and cause lightning storms.", height: "0.4 m", weight: "6.0 kg", image: "pikachu", color: "PElectric"))
    }
}



