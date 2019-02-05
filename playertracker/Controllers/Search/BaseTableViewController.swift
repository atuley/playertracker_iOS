import UIKit

class BaseTableViewController: UITableViewController {
    var filteredProducts: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeCells()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 86
    }
    private func initializeCells() {
        let nib = UINib(nibName: NibNames.searchCell, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: CellIdentifiers.searchCell)
    }
}

