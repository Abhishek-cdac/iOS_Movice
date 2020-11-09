//
//  LoginViewController.swift
//  SelfCare
//
//  Created by Sagar Ranshur on 11/05/20.
//  Copyright © 2020 Sagar Ranshur. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var contactNoTxt: CustomTextField!
    @IBOutlet weak var passwordTxtField: CustomTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    //MARK: - Setup View
       //MARK: -
       func setUp() {
           passwordTxtField.textField.isSecureTextEntry = true
       }
       
       //MARK: - Validations Textfileds
       //MARK: -
       func validateTextFields() -> Bool {
           if contactNoTxt.textField.text!.isEmpty {
               contactNoTxt.showErrorMessage(errorMessage: Constants.validationMesages.emptyContactNo)
               return false
           }else if contactNoTxt.textField.text!.count > 10 {
               contactNoTxt.showErrorMessage(errorMessage: Constants.validationMesages.validatemobile)
               return false
           }else if passwordTxtField.textField.text!.isEmpty {
               passwordTxtField.showErrorMessage(errorMessage: Constants.validationMesages.emptyPassword)
               return false
           }
        
           return true
       }
    
    @IBAction func signInBtnClicked(_ sender: CustomButton) {
        if validateTextFields() {
            //Success
        }
    }
    

}
