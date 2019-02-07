import UIKit

class SearchCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var info: UILabel!
    @IBOutlet weak var playerImage: UIImageView!
    
    let url = URL(string: "https://ak-static.cms.nba.com/wp-content/uploads/headshots/nba/1610612744/2018/260x190/201939.png")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let imageView = UIImageView()
        imageView.frame.size = CGSize(width: 100, height: 100)
        imageView.image = UIImage(named: "GSW")
        imageView.alpha = 0.3
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.insertSubview(imageView, at: 0)

        let horizontalConstraint = NSLayoutConstraint(item: imageView, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        self.addConstraint(horizontalConstraint)

        let verticalConstraint = NSLayoutConstraint(item: imageView, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0)
        self.addConstraint(verticalConstraint)
        
        let widthConstraint = NSLayoutConstraint(item: imageView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 500)
        self.addConstraint(widthConstraint)
        let heightConstraint = NSLayoutConstraint(item: imageView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 500)
        self.addConstraint(heightConstraint)
        
    }
    
    func configure(player: String) {
        name.text = "STEPHEN CURRY"
        name.backgroundColor = UIColor.yellow
        info.text = "#30 // PG"
        info.backgroundColor = UIColor.yellow
        playerImage.image = Utilities.getImageFromUrl(url: url!)
    }
}
