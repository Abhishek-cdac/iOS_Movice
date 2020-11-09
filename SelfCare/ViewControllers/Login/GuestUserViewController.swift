//
//  GuestUserViewController.swift
//  SelfCare
//
//  Created by Sagar Ranshur on 20/05/20.
//  Copyright © 2020 Sagar Ranshur. All rights reserved.
//

import UIKit

class GuestUserViewController: UIViewController {

    @IBOutlet weak var mobileNoText: CustomTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func continueBtnClicked(_ sender: CustomButton) {
                
        if mobileNoText.textField.text!.isEmpty {
            mobileNoText.showErrorMessage(errorMessage: Constants.validationMesages.emptyOrganization)
            return
        }else if mobileNoText.textField.text != "Movicel"  {
            mobileNoText.showErrorMessage(errorMessage: Constants.validationMesages.validOrganization)
            return
        }
//        Constants.singleton.contactNo = mobileNoText.textField.text!
//        Constants.singleton.isGuestLogin = true
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(true, forKey: Constants.UserDefaults.firstTimeUser)
        userDefaults.synchronize()
        
        let dashboardVC = Constants.Storyboards.main.instantiateViewController(identifier: "LoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(dashboardVC, animated: true)
    }
}
