import Foundation

struct Player: Decodable {
    var id: String?
    var firstName: String?
    var lastName: String?
    var number: String?
    var position: String?
    var teamId: String?
    var teamColor: String?
    var images: PlayerImages
}
