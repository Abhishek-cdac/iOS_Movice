//
//  PaymentOptionsCell.swift
//  SelfCare
//
//  Created by Sagar Ranshur on 12/05/20.
//  Copyright © 2020 Sagar Ranshur. All rights reserved.
//

import UIKit

class PaymentOptionsCell: UITableViewCell {

    @IBOutlet weak var optionLabel: UILabel!
    @IBOutlet weak var selectionImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
