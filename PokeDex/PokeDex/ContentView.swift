import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Int = 0
    init() {
        let customColor = UIColor(red: 0.46, green: 0.46, blue: 0.46, alpha: 1.0)
        UITabBar.appearance().unselectedItemTintColor = customColor
    }
    
    var body: some View {
        ZStack {
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
