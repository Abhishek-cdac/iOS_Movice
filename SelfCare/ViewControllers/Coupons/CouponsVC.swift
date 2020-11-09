//
//  CouponsVC.swift
//  SelfCare
//
//  Created by Sagar Ranshur on 18/05/20.
//  Copyright © 2020 Sagar Ranshur. All rights reserved.
//

import UIKit

class CouponsVC: UIViewController {

    @IBOutlet weak var backBtnImage: UIImageView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var mobileNoTxt: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mobileNoTxt.text = Constants.singleton.contactNo
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        //manage tap bar
        if (tabBarController != nil) && !(tabBarController?.tabBar.isHidden)!{
            //visible
            backBtn.isUserInteractionEnabled = false
            backBtn.isHidden = true
            backBtnImage.isHidden = true
        }else {
            backBtn.isUserInteractionEnabled = true
            backBtn.isHidden = false
            backBtnImage.isHidden = false
        }
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    //MARK: - Button Action methods
    @IBAction func backBtnClicked(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func rechargeBtnClicked(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
    
}
