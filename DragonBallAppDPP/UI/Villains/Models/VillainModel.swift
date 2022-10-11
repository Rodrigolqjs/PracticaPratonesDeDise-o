
import Foundation

struct Villain: Character, Decodable {
    let id: String
    let name: String
    let description: String
    let photo: URL
    let favorite: Bool
}
