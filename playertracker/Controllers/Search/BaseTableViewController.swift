import UIKit

class BaseTableViewController: UITableViewController {
    var filteredProducts: [String] = []
    
    static let tableViewCellIdentifier = "searchCell"
    private static let nibName = "SearchCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: BaseTableViewController.nibName, bundle: nil)
        
        // Required if our subclasses are to use `dequeueReusableCellWithIdentifier(_:forIndexPath:)`.
        tableView.register(nib, forCellReuseIdentifier: BaseTableViewController.tableViewCellIdentifier)
    }
}

