import UIKit

class SearchCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var info: UILabel!
    @IBOutlet weak var playerImage: UIImageView!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        configureTeamLogoBackground()
    }
    
    func configure(player: Player) {
        name.text = "\(player.firstName!) \(player.lastName!)"
        name.backgroundColor = UIColor.yellow
        name.alpha = 0.9
        info.text = "#\(player.number!) // \(player.position!)"
        info.backgroundColor = UIColor.yellow
        info.alpha = 0.9
        playerImage.image = Utilities.getImageFromUrl(url: player.images.player!)
    }
    
    private func configureTeamLogoBackground() {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "GSW") //NOTE: THIS LINE MAY CAUSE THE SAME TEAM LOGO TO ALWAYS BE RENDERED(DOES THIS MUTATE GLOBAL STATE?)
        imageView.alpha = 0.3
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.insertSubview(imageView, at: 0)
        
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        imageView.widthAnchor.constraint(equalToConstant: 500).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 500).isActive = true
    }
}
