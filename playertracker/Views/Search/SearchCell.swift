import UIKit

class SearchCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(product: String) {
        name.text = product
    }
}
