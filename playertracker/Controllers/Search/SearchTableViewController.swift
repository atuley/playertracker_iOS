import UIKit

class SearchTableViewController: BaseTableViewController {
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
            if let textfield = searchController.searchBar.value(forKey: "searchField") as? UITextField {
                textfield.textColor = UIColor.blue
                if let backgroundview = textfield.subviews.first {
                    backgroundview.backgroundColor = UIColor.white.withAlphaComponent(0.95)
                    backgroundview.layer.cornerRadius = 10;
                    backgroundview.clipsToBounds = true;
                }
            }
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

extension SearchTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let player = players[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.searchCell, for: indexPath) as? SearchCell   {
            cell.layer.insertSublayer(Utilities.createImageGradient(player: player), at: 0)
            cell.selectionStyle = UITableViewCell.SelectionStyle.none;
            cell.configure(player: player, viewWidth: self.view.bounds.width)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
}

extension SearchTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

extension SearchTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        var filteredResults = players
        
        filteredResults = filteredResults.filter{
            return ("\(String(describing: $0.firstName?.lowercased())) \(String(describing: $0.lastName?.lowercased()))".contains(searchController.searchBar.text!.lowercased()))
        }
        
        if let resultsController = searchController.searchResultsController as? ResultsTableViewController {
            resultsController.filteredPlayers = filteredResults
            resultsController.tableView.reloadData()
        }
    }
}
