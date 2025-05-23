import UIKit

class SearchCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var info: UILabel!
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var smallTeamLogo: UIImageView!
    @IBOutlet weak var largeTeamLogo: UIImageView!
    @IBOutlet weak var followButton: FollowButton!
    private var player: Player!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func follow(_ sender: Any) {
        let defaults = UserDefaults.standard
        let playersWatching = defaults.array(forKey: "playersWatching") as! [String]
        var newPlayersWatching: [String] = []

        if(playersWatching.contains(player.id!)) {
            newPlayersWatching = delete(players: playersWatching, element: player.id!)
            followButton.unfollow()
            print(newPlayersWatching)
        } else {
            newPlayersWatching = playersWatching + [player.id!]
            followButton.follow()
            print(newPlayersWatching)
        }
        
        defaults.set(newPlayersWatching, forKey: "playersWatching")
    }
    
    func configure(player: Player, viewWidth: CGFloat) {
        self.player = player
        let defaults = UserDefaults.standard
        let playersWatching = defaults.array(forKey: "playersWatching") as! [String]
        if(playersWatching.contains(player.id!)) {
            followButton.setTitle(ButtonTitles.unfollow, for: .normal)
        }
        
        setupNameConstraints(viewWidth: viewWidth)
        name.text = "\(player.firstName!.uppercased()) \(player.lastName!.uppercased())"
        name.textColor = UIColor.white
        info.text = "#\(player.number!) | \(player.position!)"
        info.textColor = Utilities.convertHexToColor(hex: "#CECECE")
        playerImage.image = Utilities.getImageFromUrl(url: player.images.player!)
        
        playerImage.layer.masksToBounds = false
        playerImage.layer.cornerRadius = playerImage.frame.height / 2 + 8
        playerImage.clipsToBounds = true
        
        smallTeamLogo.image = UIImage(named: player.tricode!)
        largeTeamLogo.image = UIImage(named: player.tricode!)
    }
    
    private func setupNameConstraints(viewWidth: CGFloat) {
        var widthConstraint: CGFloat = 0
        
        if(viewWidth == ViewWidths.iphone5) {
            widthConstraint = 75.0
        } else if(viewWidth >= ViewWidths.iphone6 && viewWidth < ViewWidths.ipadAir) {
            widthConstraint = 100.0
        } else {
            widthConstraint = 200.0
        }
        
        name.addConstraint(NSLayoutConstraint(item: name, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: widthConstraint))
    }
    
    private func delete(players: [String], element: String) -> [String] {
        return players.filter() { $0 != element }
    }
}
