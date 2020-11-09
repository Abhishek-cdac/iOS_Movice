//
//  PaymentSuccessViewController.swift
//  SelfCare
//
//  Created by Sagar Ranshur on 13/05/20.
//  Copyright © 2020 Sagar Ranshur. All rights reserved.
//

import UIKit

class PaymentSuccessViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tabBarController?.tabBar.isHidden = true
    }
    
    @IBAction func homeBtnClicked(_ sender: UITapGestureRecognizer) {
        
        let tabBar = Constants.Storyboards.main.instantiateViewController(identifier: "TabBarViewController") as! TabBarViewController
        navigationController?.pushViewController(tabBar, animated: true)
    }
    
}
