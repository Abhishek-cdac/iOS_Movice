//
//  TroubleShootVC.swift
//  SelfCare
//
//  Created by Sagar Ranshur on 18/05/20.
//  Copyright © 2020 Sagar Ranshur. All rights reserved.
//

import UIKit

class TroubleShootVC: UIViewController {

    @IBOutlet weak var mobileNoTxt: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mobileNoTxt.text = Constants.singleton.contactNo
    }
    
    @IBAction func backBtnClicked(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
