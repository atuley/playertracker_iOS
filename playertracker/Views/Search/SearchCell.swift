//
//  SearchCell.swift
//  playertracker
//
//  Created by Alex Tuley on 2/5/19.
//  Copyright © 2019 Alex Tuley. All rights reserved.
//

import UIKit

class SearchCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(player: String) {
        name.text = player
    }
}
