import UIKit

class BaseTableViewController: UITableViewController {
    var filteredPlayers: [Player] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeCells()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(XibHeights.search)
    }
    
    private func initializeCells() {
        let nib = UINib(nibName: NibNames.searchCell, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: CellIdentifiers.searchCell)
    }
}

