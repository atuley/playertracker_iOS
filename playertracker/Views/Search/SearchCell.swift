import UIKit

class SearchCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var info: UILabel!
    @IBOutlet weak var playerImage: UIImageView!
    
    let url = URL(string: "https://ak-static.cms.nba.com/wp-content/uploads/headshots/nba/1610612744/2018/260x190/201939.png")
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(player: String) {
        name.text = "STEPHEN CURRY"
        name.backgroundColor = UIColor.yellow
        info.text = "#30 // PG"
        info.backgroundColor = UIColor.yellow
        playerImage.image = Utilities.getImageFromUrl(url: url!)
    }
}
