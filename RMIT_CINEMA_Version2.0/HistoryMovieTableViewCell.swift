//
//  HistoryMovieTableViewCell.swift
//  RMIT_CINEMA_Version2.0
//
//  Created by JUNHUI HOU on 7/04/2016.
//  Copyright © 2016 RMIT-JunHui Hou. All rights reserved.
//

import UIKit

class HistoryMovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
}
