import SwiftUI

struct ButtonView<Destination: View>: View {
    let title: String
    let imageName: String
    let backgroundColor: Color
    let destination: Destination
    
    var body: some View {
        NavigationLink(destination: destination) {
            HStack {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.vertical, 15)
                    .padding(.horizontal, 20)
                
                Spacer()
                
                Image(systemName: imageName)
                    .foregroundColor(.white)
                    .padding(.trailing, 10)
                    .font(.title)
            }
            .background(backgroundColor)
            .cornerRadius(8)
        }
        .padding()
    }
}
struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "List of Pokemon", imageName: "chevron.right", backgroundColor: .green, destination: PokemonView())
    }
}
