import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        
        ZStack(alignment: .leading) {
            
            
            TextField("", text: $text)
                .padding(8)
                .background(Color.white) // Update the background color to white
                .cornerRadius(20)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .padding(.leading, 8)
                        Spacer(minLength: 0)
                    }
                )
                .foregroundColor(.gray)
            
            if text.isEmpty {
                Text("Search")
                    .padding(.leading, 32)
                    .foregroundColor(.gray)
            }
        }
        .padding(.horizontal, 30)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
    }
}



