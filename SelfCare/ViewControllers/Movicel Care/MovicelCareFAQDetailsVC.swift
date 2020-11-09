//
//  MovicelCareFAQDetailsVC.swift
//  SelfCare
//
//  Created by Sagar Ranshur on 18/05/20.
//  Copyright © 2020 Sagar Ranshur. All rights reserved.
//

import UIKit

class MovicelCareFAQDetailsVC: UIViewController {

    
    @IBOutlet weak var mobileNoTxt: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mobileNoTxt.text = Constants.singleton.contactNo
    }
    
    
    @IBAction func backBtnClicked(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
