//
//  VoucherBuyCustomTableCell.swift
//  SelfCare
//
//  Created by Sagar Ranshur on 14/05/20.
//  Copyright © 2020 Sagar Ranshur. All rights reserved.
//

import UIKit

protocol VoucherBuyDelegate {
    func selectionButtonMethod(indexPath: IndexPath)
}

class VoucherBuyCustomTableCell: UITableViewCell {

    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var selectionBtn: UIButton!
    
    var index : IndexPath?
    
    var buyDelegate: VoucherBuyDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func selectionBtnClicked(_ sender: UIButton) {
        buyDelegate?.selectionButtonMethod(indexPath: index!)
    }
    

}
