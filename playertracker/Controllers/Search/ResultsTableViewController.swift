import UIKit

class ResultsTableViewController: BaseTableViewController {    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredProducts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = filteredProducts[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.searchCell, for: indexPath) as? SearchCell   {
            cell.layer.insertSublayer(Utilities.createImageGradient(), at: 0)
//            cell.configure(player: Player())
            return cell
        } else {
            return UITableViewCell()
        }
    }
}
