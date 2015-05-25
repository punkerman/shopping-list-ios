//
//  TableViewCell.swift
//  newPod
//
//  Created by internet on 5/23/15.
//  Copyright (c) 2015 jvm corp. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var titleProd: UILabel!
    @IBOutlet weak var brandProd: UILabel!
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var imageProd: UIImageView!
    @IBOutlet weak var priceProd: UILabel!
    
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
