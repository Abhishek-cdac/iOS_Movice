//
//  ServiceCenterTableViewCell.swift
//  SelfCare
//
//  Created by Sagar Ranshur on 19/05/20.
//  Copyright © 2020 Sagar Ranshur. All rights reserved.
//

import UIKit


class ServiceCenterTableViewCell: UITableViewCell {

    
    @IBOutlet weak var baseView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        baseView.elevate(elevation: 2.0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
