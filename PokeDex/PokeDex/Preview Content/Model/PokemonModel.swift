import SwiftUI

struct Pokemon: Identifiable, Codable, Equatable, Hashable {
    
    var id = UUID()
    
    let name: String
    let type: String
    let description: String
    let height: String
    let weight: String
    let image: String
    let color: String
    
    private enum CodingKeys :String, CodingKey{
        case name
        case type
        case description
        case height
        case weight
        case image
        case color
    }
    
    static func ==(lhs: Pokemon, rhs: Pokemon) -> Bool {
        return lhs.id == rhs.id
    }
}


