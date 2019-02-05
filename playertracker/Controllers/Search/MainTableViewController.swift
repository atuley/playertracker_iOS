import UIKit

class MainTableViewController: BaseTableViewController {

    /// Search controller to help us with filtering.
    private var searchController: UISearchController!

    /// Secondary search results table view.
    private var resultsTableViewController: ResultsTableViewController!

    /// Restoration state for UISearchController
    //private var restoredState = SearchControllerRestorableState()
    
    var products: [String] = ["alex", "nick", "randy", "mike", "kody"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultsTableViewController = ResultsTableViewController()
        
        resultsTableViewController.tableView.delegate = self
        
        searchController = UISearchController(searchResultsController: resultsTableViewController)
        searchController.searchResultsUpdater = self
        searchController.searchBar.autocapitalizationType = .none
        
//        if #available(iOS 11.0, *) {
//            // For iOS 11 and later, place the search bar in the navigation bar.
//            navigationItem.searchController = searchController
//
//            // Make the search bar always visible.
//            navigationItem.hidesSearchBarWhenScrolling = false
//        } else {
            // For iOS 10 and earlier, place the search controller's search bar in the table view's header.
            tableView.tableHeaderView = searchController.searchBar
//        }
        
        searchController.delegate = self
        searchController.dimsBackgroundDuringPresentation = false // The default is true.
        searchController.searchBar.delegate = self // Monitor when the search button is tapped.
        
        /** Search presents a view controller by applying normal view controller presentation semantics.
         This means that the presentation moves up the view controller hierarchy until it finds the root
         view controller or one that defines a presentation context.
         */
        
        /** Specify that this view controller determines how the search controller is presented.
         The search controller should be presented modally and match the physical size of this view controller.
         */
        definesPresentationContext = true
    }
}

// MARK: - UITableViewDataSource

extension MainTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let product = products[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: BaseTableViewController.tableViewCellIdentifier, for: indexPath) as? SearchCell   {
            cell.configure(player: product)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
}

// MARK: - UISearchBarDelegate

extension MainTableViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
}

// MARK: - UISearchControllerDelegate

// Use these delegate functions for additional control over the search controller.

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


// MARK: - UISearchResultsUpdating

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
