//
//  TableViewCell.swift
//  Dictionary
//
//  Created by Ebubekir Aykut on 22.11.2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var ingilizceLabel: UILabel!
    @IBOutlet weak var turkceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
