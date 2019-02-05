import UIKit

class SearchCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(player: String) {
        name.text = player
    }
}
