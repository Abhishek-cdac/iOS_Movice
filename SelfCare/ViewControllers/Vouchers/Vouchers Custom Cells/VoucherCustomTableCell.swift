//
//  VoucherCustomTableCell.swift
//  SelfCare
//
//  Created by Sagar Ranshur on 14/05/20.
//  Copyright © 2020 Sagar Ranshur. All rights reserved.
//

import UIKit

class VoucherCustomTableCell: UITableViewCell {

    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var leftCashBackView: UIView!
    @IBOutlet weak var cashbackLabel: UILabel!
    @IBOutlet weak var cashbackAmountLabel: UILabel!
    
    @IBOutlet weak var selectBtn: UIButton!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var transferableLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func selectBtnClicked(_ sender: UIButton) {
        
    }
}
