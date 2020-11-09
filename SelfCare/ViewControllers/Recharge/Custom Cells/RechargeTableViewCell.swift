//
//  RechargeTableViewCell.swift
//  SelfCare
//
//  Created by Sagar Ranshur on 12/05/20.
//  Copyright © 2020 Sagar Ranshur. All rights reserved.
//

import UIKit

class RechargeTableViewCell: UITableViewCell {

    @IBOutlet weak var selectionImage: UIImageView!
    @IBOutlet weak var planLabel: UILabel!
    @IBOutlet weak var validityLabel: UILabel!
    @IBOutlet weak var benefitsLabel: UILabel!
    @IBOutlet weak var infoImage: UIImageView!
    @IBOutlet weak var baseView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
