import UIKit

class SearchCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var info: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(player: String) {
        name.text = player
        name.backgroundColor = UIColor.yellow
        info.text = "#30 // PG"
        info.backgroundColor = UIColor.yellow
    }
}
