import Foundation

class MockPlayerSearchService: SearchService {
    func getPlayerSearchResults(completionHandler: @escaping (PlayerSearchResult?, Error?) -> Void) {
        // Create sample player images
        let playerImageUrl = URL(string: "https://ak-static.cms.nba.com/wp-content/uploads/headshots/nba/latest/260x190/203500.png")!
        let teamLogoUrl = URL(string: "https://www.nba.com/assets/logos/teams/primary/web/OKC.svg")!
        let playerImages = PlayerImages(player: playerImageUrl, teamLogo: teamLogoUrl)
        
        // Create sample players
        let players = [
            Player(
                id: "203500",
                firstName: "Steven",
                lastName: "Adams",
                number: "12",
                position: "C",
                teamId: "1610612760",
                teamColor: "#007AC1",
                tricode: "OKC",
                images: playerImages
            ),
            Player(
                id: "1629027",
                firstName: "Shai",
                lastName: "Gilgeous-Alexander",
                number: "2",
                position: "PG",
                teamId: "1610612760",
                teamColor: "#007AC1",
                tricode: "OKC",
                images: playerImages
            )
        ]
        
        // Create the search result
        let searchResult = PlayerSearchResult(players: players)
        
        // Simulate network delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            completionHandler(searchResult, nil)
        }
    }
} 