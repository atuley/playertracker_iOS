import UIKit

class SearchCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var info: UILabel!
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var smallTeamLogo: UIImageView!
    @IBOutlet weak var largeTeamLogo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(player: Player, viewWidth: CGFloat) {
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
}
