import Foundation

protocol Character {
    var id: String { get }
    var name: String { get }
    var description: String { get }
    var photo: URL { get }
    var favorite: Bool { get }

}
