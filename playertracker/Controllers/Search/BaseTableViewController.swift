import UIKit

class BaseTableViewController: UITableViewController {
    var filteredPlayers: [Player] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeCells()
        tableView.backgroundColor = Utilities.convertHexToColor(hex: "#2D2D2D")
        tableView.rowHeight = CGFloat(XibHeights.search)
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    private func initializeCells() {
        let nib = UINib(nibName: NibNames.searchCell, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: CellIdentifiers.searchCell)
    }
}

