//
//  SignUpViewController.swift
//  SelfCare
//
//  Created by Sagar Ranshur on 18/05/20.
//  Copyright © 2020 Sagar Ranshur. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var fullNameTxt: CustomTextField!
    @IBOutlet weak var emailIdTxt: CustomTextField!
    @IBOutlet weak var contactNoTxt: CustomTextField!
    @IBOutlet weak var passwordTxt: CustomTextField!
    @IBOutlet weak var confirmPassTxt: CustomTextField!
    
    @IBOutlet weak var signInBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
    }
    
    func setUpView()  {
        
        passwordTxt.textField.isSecureTextEntry = true
        confirmPassTxt.textField.isSecureTextEntry = true

        contactNoTxt.isMobile = true
        contactNoTxt.extensionStr = "+244"
        contactNoTxt.textField.maxLength = 14
    }
    
    //MARK: - Field Validations
    //MARK: -
    func validateFields() -> Bool {
        
        let contactStr = contactNoTxt.textField.text
        
        if fullNameTxt.textField.text!.isEmpty {
            fullNameTxt.showErrorMessage(errorMessage: Constants.validationMesages.emptyFullname)
            return false
        }
        if emailIdTxt.textField.text!.isEmpty {
            emailIdTxt.showErrorMessage(errorMessage: Constants.validationMesages.emptyEmailId)
            return false
        }
        if !Utility.isValidEmail(testStr: emailIdTxt.textField.text!){
            emailIdTxt.showErrorMessage(errorMessage: Constants.validationMesages.validEmailId)
            return false
        }
        if contactNoTxt.textField.text!.isEmpty {
            contactNoTxt.showErrorMessage(errorMessage: Constants.validationMesages.emptyContactNo)
            return false
        }
        if contactNoTxt.textField.text!.count != 14  {
            contactNoTxt.showErrorMessage(errorMessage: Constants.validationMesages.validatemobile)
            return false
        }
        if (contactStr?.getCharacterAtIndex(index: 5) != "9") {
            contactNoTxt.showErrorMessage(errorMessage: Constants.validationMesages.validatemobile)
            return false
        }
        if contactStr?.getCharacterAtIndex(index: 6) != "9" && contactStr?.getCharacterAtIndex(index: 6) != "1" {
            contactNoTxt.showErrorMessage(errorMessage: Constants.validationMesages.validatemobile)
            return false
        }
        if passwordTxt.textField.text!.isEmpty {
            passwordTxt.showErrorMessage(errorMessage: Constants.validationMesages.emptyPassword)
            return false
        }
        if confirmPassTxt.textField.text!.isEmpty {
            confirmPassTxt.showErrorMessage(errorMessage: Constants.validationMesages.emptyConfPassword)
            return false
        }
        if passwordTxt.textField.text != confirmPassTxt.textField.text {
            confirmPassTxt.showErrorMessage(errorMessage: Constants.validationMesages.passwordMismatch)
            return false
        }
        return true
    }
    
    
    //MARK: - Button action methods
    //MARK: -
    
    @IBAction func signInBtnClicked(_ sender: UIButton) {
        let signUpVC = Constants.Storyboards.main.instantiateViewController(identifier: "LoginViewController") as! LoginViewController
        navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    @IBAction func signUpBtnClicked(_ sender: CustomButton) {
         
         if validateFields() {
            //validates successfully...
            let userDefaults = UserDefaults.standard
            userDefaults.set(true, forKey: Constants.UserDefaults.firstTimeUser)
            userDefaults.synchronize()
            
            Constants.singleton.contactNo = contactNoTxt.textField.text!
            Constants.singleton.userNameStr = fullNameTxt.textField.text!
            Constants.singleton.emailIdStr = emailIdTxt.textField.text!

            let dashboardVC = Constants.Storyboards.main.instantiateViewController(identifier: "TabBarViewController") as! TabBarViewController
            self.navigationController?.pushViewController(dashboardVC, animated: true)
        }
    }
}
