//
//  MovieTableViewCell.swift
//  RMIT_CINEMA_Version2.0
//
//  Created by JUNHUI HOU on 9/05/2016.
//  Copyright © 2016 RMIT-JunHui Hou. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var movieimage: UIImageView!
    @IBOutlet weak var moviename: UILabel!
    @IBOutlet weak var movierunningtime: UILabel!
    @IBOutlet weak var moviereleasedate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
