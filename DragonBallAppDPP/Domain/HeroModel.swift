import Foundation

struct Hero: Decodable {
  let id: String
  let name: String
  let description: String
  let photo: URL
  let favorite: Bool
}
