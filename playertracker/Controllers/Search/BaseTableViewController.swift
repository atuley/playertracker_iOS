import UIKit

class BaseTableViewController: UITableViewController {
    var filteredProducts: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeCells()
    }
    
    private func initializeCells() {
        let nib = UINib(nibName: NibNames.searchCell, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: CellIdentifiers.searchCell)
    }
}

