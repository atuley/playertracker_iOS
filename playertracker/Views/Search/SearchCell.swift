import UIKit

class SearchCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var info: UILabel!
    @IBOutlet weak var playerImage: UIImageView!
    
    let url = URL(string: "https://ak-static.cms.nba.com/wp-content/uploads/headshots/nba/1610612744/2018/260x190/201939.png")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureTeamLogoBackground()
    }
    
    func configure(player: String) {
        name.text = "STEPHEN CURRY"
        name.backgroundColor = UIColor.yellow
        name.alpha = 0.9
        info.text = "#30 // PG"
        info.backgroundColor = UIColor.yellow
        info.alpha = 0.9
        playerImage.image = Utilities.getImageFromUrl(url: url!)
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
