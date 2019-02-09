import UIKit

class SearchCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var info: UILabel!
    @IBOutlet weak var playerImage: UIImageView!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configure(player: Player) {
        name.text = "\(player.firstName!) \(player.lastName!)"
        name.backgroundColor = UIColor.yellow
        name.alpha = 0.9
        info.text = "#\(player.number!) // \(player.position!)"
        info.backgroundColor = UIColor.yellow
        info.alpha = 0.9
        playerImage.image = Utilities.getImageFromUrl(url: player.images.player!)
        configureTeamLogoBackground(player: player)
    }
    
    private func configureTeamLogoBackground(player: Player) {
        let imageView = UIImageView()
        imageView.image = UIImage(named: player.tricode!)
        imageView.alpha = 0.3
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.insertSubview(imageView, at: 1)
        
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        imageView.widthAnchor.constraint(equalToConstant: 250).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
    }
}
