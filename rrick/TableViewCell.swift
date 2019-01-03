//
//  TableViewCell.swift
//  rrick
//
//  Created by Andrew on 03/10/2018.
//  Copyright © 2018 Andrew. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet var heroImage: UIImageView!
    @IBOutlet var heroName: UILabel!
    @IBOutlet var heroInfo1: UILabel!
    @IBOutlet var heroInfo2: UILabel!
    @IBOutlet var heroInfo3: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
