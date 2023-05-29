import SwiftUI

struct OutwardCurvedRectangle: Shape {
    let cornerRadius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let width = rect.size.width
        let height = rect.size.height
        
        let curveHeight: CGFloat = -280 // Adjust this value to control the curve height
        let curveOffset: CGFloat = 0.4 // Adjust this value to control the curve offset
        
        let controlX = width / 2
        let controlY = rect.maxY + curveHeight * curveOffset
        
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addQuadCurve(to: CGPoint(x: rect.minX, y: rect.maxY),
                          control: CGPoint(x: controlX, y: controlY))
        path.closeSubpath()
        
        return path
    }
}

struct OutwardCurvedRectangleDemo: View {
    var body: some View {
        VStack{
            ZStack {
                VStack{
                    GeometryReader { geometry in
                        OutwardCurvedRectangle(cornerRadius: 20)
                            .fill(Color.PFighting)
                            .frame(width: geometry.size.width)
                            .frame(height: 550) // Adjust the height as needed
                    }
                    Image(systemName: "circle.circle")
                        .font(Font.system(size: 320))
                        .foregroundColor(.white) // Change the color to white
                        .opacity(0.2) // Apply opacity (0.0 to 1.0)
                        .padding(.bottom, 380)
                }
                
                HStack{
                    Spacer()
                        .frame(width: 30)
                    Image(systemName: "circle.circle")
                        .bold()
                        .foregroundColor(Color.white)
                        .font(.title)
                    Text("  Pokedex")
                        .bold()
                        .foregroundColor(Color.white)
                        .font(.title)
                    Spacer()
                }.padding(.bottom, 650)
                VStack{
                    Text("Find Your \nFavorite Pokemon")
                        .foregroundColor(Color.white)
                        .font(.largeTitle)
                        .bold()
                        .kerning(3)
                    SearchBar(text: .constant(""))
                    Spacer()
                        .frame(height: 90)
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
        
    }
}

struct OutwardCurvedRectangleDemo_Previews: PreviewProvider {
    static var previews: some View {
        OutwardCurvedRectangleDemo()
    }
}
