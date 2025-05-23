import UIKit

class ResultsTableViewController: BaseTableViewController {    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredPlayers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let player = filteredPlayers[indexPath.row]
        
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
