//
//  PlansTableViewCell.swift
//  SelfCare
//
//  Created by Sagar Ranshur on 22/05/20.
//  Copyright © 2020 Sagar Ranshur. All rights reserved.
//

import UIKit

protocol PlansDelegate: NSObject {
    func downBtnAction(indexPath: Int)
}

class PlansTableViewCell: UITableViewCell {
    
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var downBtn: UIButton!
    
    var index: Int?
    
    var plansDelegate: PlansDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func downBtnClicked(_ sender: UIButton) {
        plansDelegate?.downBtnAction(indexPath: index ?? 0)
    }
}
