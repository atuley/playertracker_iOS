import UIKit

class MainTableViewController: BaseTableViewController {
    private var searchController: UISearchController!
    private var resultsTableViewController: ResultsTableViewController!
    
    var players: [Player] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = NavbarTitles.search
        configureResultsController()
        configureSearchController()
        
        fetchPlayers()
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
        
        searchController.delegate = self as? UISearchControllerDelegate
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        definesPresentationContext = true
    }
    
    private func fetchPlayers() {
        PlayerSearchService().getPlayerSearchResults() {
            (playerSearchResult, error) in
            if error != nil {
                print("Error searching : \(String(describing: error))")
                return
            } else if let playerSearchResult = playerSearchResult {
                self.players = playerSearchResult.players
                self.tableView.reloadData()
            }
        }
    }
}

extension MainTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let player = players[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.searchCell, for: indexPath) as? SearchCell   {
            cell.layer.insertSublayer(Utilities.createImageGradient(player: player), at: 0)
            cell.configure(player: player)
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

extension MainTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        var filteredResults = players
        
        filteredResults = filteredResults.filter{
            return $0.firstName == searchController.searchBar.text!
        }
        
        if let resultsController = searchController.searchResultsController as? ResultsTableViewController {
            resultsController.filteredPlayers = filteredResults
            resultsController.tableView.reloadData()
        }
    }
}
