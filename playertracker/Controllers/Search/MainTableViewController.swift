import UIKit

class MainTableViewController: BaseTableViewController {
    private var searchController: UISearchController!
    private var resultsTableViewController: ResultsTableViewController!
    
    var products: [String] = ["alex", "nick", "randy", "mike", "kody"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = NavbarTitles.search
        configureResultsController()
        configureSearchController()
    }
    
    private func configureResultsController() {
        resultsTableViewController = ResultsTableViewController()
        resultsTableViewController.tableView.delegate = self
    }
    
    private func configureSearchController() {
        searchController = UISearchController(searchResultsController: resultsTableViewController)
        searchController.searchResultsUpdater = self
        searchController.searchBar.autocapitalizationType = .none
        
        if #available(iOS 11.0, *) {
            navigationItem.searchController = searchController
            navigationItem.hidesSearchBarWhenScrolling = false
        } else {
            tableView.tableHeaderView = searchController.searchBar
        }
        
        searchController.delegate = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        definesPresentationContext = true
    }
}

extension MainTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let product = products[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.searchCell, for: indexPath) as? SearchCell   {
            cell.configure(player: product)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
}

extension MainTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

extension MainTableViewController: UISearchControllerDelegate {
    func presentSearchController(_ searchController: UISearchController) {
        debugPrint("UISearchControllerDelegate invoked method: \(#function).")
    }
    
    func willPresentSearchController(_ searchController: UISearchController) {
        debugPrint("UISearchControllerDelegate invoked method: \(#function).")
    }
    
    func didPresentSearchController(_ searchController: UISearchController) {
        debugPrint("UISearchControllerDelegate invoked method: \(#function).")
    }
    
    func willDismissSearchController(_ searchController: UISearchController) {
        debugPrint("UISearchControllerDelegate invoked method: \(#function).")
    }
    
    func didDismissSearchController(_ searchController: UISearchController) {
        debugPrint("UISearchControllerDelegate invoked method: \(#function).")
    }
}

extension MainTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        var filteredResults = products
        
        filteredResults = filteredResults.filter{
            return $0 == searchController.searchBar.text!
            
        }
        
        if let resultsController = searchController.searchResultsController as? ResultsTableViewController {
            resultsController.filteredProducts = filteredResults
            resultsController.tableView.reloadData()
        }
    }
}
