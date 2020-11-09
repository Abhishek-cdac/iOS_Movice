//
//  LoginViewController.swift
//  SelfCare
//
//  Created by Sagar Ranshur on 11/05/20.
//  Copyright © 2020 Sagar Ranshur. All rights reserved.
//

import UIKit

protocol GuestLoginDelegate {
    func loginCompleted()
}

class LoginViewController: UIViewController {
    
    @IBOutlet weak var contactNoTxt: CustomTextField!
    @IBOutlet weak var passwordTxtField: CustomTextField!
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var langBtn: CustomButton!
    
    @IBOutlet weak var langSelectionBaseView: UIView!
    @IBOutlet weak var engBtn: UIButton!
    @IBOutlet weak var portugueseBtn: UIButton!
    
    @IBOutlet weak var langSelHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var guestLoginBtn: CustomButton!
    
    var isFromBuyNow = false
    
    var guestLoginDelegate: GuestLoginDelegate?
    
    
    var isLanuageHidden = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUp()
        contactNoTxt.textField.text = "+244 919389843"
        passwordTxtField.textField.text = "1234"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        var sellang = UserDefaults.standard.value(forKey: Constants.UserDefaults.selectedLanguage) as? String
        
        if sellang == "" || sellang == nil {
            sellang = "English"
        }
        
        self.langBtn.setTitle(sellang, for: .normal)
        
        if Constants.singleton.isGuestLogin {
            guestLoginBtn.isHidden = true
            guestLoginBtn.isEnabled = false
        }else {
            guestLoginBtn.isHidden = false
            guestLoginBtn.isEnabled = true
        }
    }
    
    //MARK: - Setup View
    //MARK: -
    func setUp() {
        passwordTxtField.textField.isSecureTextEntry = true
        contactNoTxt.isMobile = true
        contactNoTxt.extensionStr = "+244"
        contactNoTxt.textField.maxLength = 14
        
        let attributedString = NSMutableAttributedString.init(attributedString: (signUpBtn.titleLabel?.attributedText!)!)
        attributedString.mutableString.setString(NSLocalizedString("Sign Up".localised(), comment: ""))
        
        signUpBtn.setTitle("Sign Up".localised(), for: .normal)

    }
    
    //MARK: - Validations Textfileds
    //MARK: -
    func validateTextFields() -> Bool {
        
        let contactStr = contactNoTxt.textField.text

        if contactNoTxt.textField.text!.isEmpty {
            contactNoTxt.showErrorMessage(errorMessage: Constants.validationMesages.emptyContactNo)
            return false
        }else if contactNoTxt.textField.text!.count != 14  {
            contactNoTxt.showErrorMessage(errorMessage: Constants.validationMesages.validatemobile)
            return false
        }else if (contactStr?.getCharacterAtIndex(index: 5) != "9") {
            contactNoTxt.showErrorMessage(errorMessage: Constants.validationMesages.validatemobile)
            return false
        }else if contactStr?.getCharacterAtIndex(index: 6) != "9" && contactStr?.getCharacterAtIndex(index: 6) != "1" {
            contactNoTxt.showErrorMessage(errorMessage: Constants.validationMesages.validatemobile)
            return false
        }else if passwordTxtField.textField.text!.isEmpty {
            passwordTxtField.showErrorMessage(errorMessage: Constants.validationMesages.emptyPassword)
            return false
        }
        
        return true
    }
    
    func hideShowLanguageSelectionView() {
        if isLanuageHidden {
            // hide
            UIView.animate(withDuration: 0.5) {
                self.langSelHeightConstraint.constant = 0
                self.langSelectionBaseView.isHidden = true
                self.isLanuageHidden = false
                self.view.layoutIfNeeded()
            }
            
        }else {
            UIView.animate(withDuration: 0.5) {
                self.langSelHeightConstraint.constant = 85
                self.langSelectionBaseView.isHidden = false
                self.isLanuageHidden = true
                self.view.layoutIfNeeded()
            }
        }
    }
    
    func restartApplication (extStr: String, langStr: String) {
        
        UserDefaults.standard.set([extStr], forKey: Constants.UserDefaults.applanguages)
        UserDefaults.standard.synchronize()
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(langStr, forKey: Constants.UserDefaults.selectedLanguage)
        userDefaults.synchronize()
        
        Bundle.setLanguage(extStr)
        
        restartApp()
    }
    
    func restartApp () {
        let viewController = Constants.Storyboards.main.instantiateViewController(identifier: "LoginViewController") as! LoginViewController
        let navCtrl = UINavigationController(rootViewController: viewController)

        guard
                let window = UIApplication.shared.keyWindow,
                let rootViewController = window.rootViewController
                else {
            return
        }

        navCtrl.view.frame = rootViewController.view.frame
        navCtrl.view.layoutIfNeeded()

        UIView.transition(with: window, duration: 0.7, options: .transitionFlipFromTop, animations: {
            window.rootViewController = navCtrl
        })

    }

    
    
    @IBAction func signInBtnClicked(_ sender: CustomButton) {
        if validateTextFields() {
            //Success
            Constants.singleton.contactNo = contactNoTxt.textField.text!
            
            if isFromBuyNow {
                
                guestLoginDelegate?.loginCompleted()
                self.dismiss(animated: true, completion: nil)
                
            }else {
                let dashboardVC = Constants.Storyboards.main.instantiateViewController(identifier: "TabBarViewController") as! TabBarViewController
                self.navigationController?.pushViewController(dashboardVC, animated: true)
            }
        }
    }
    
    
    @IBAction func signUpbtnClicked(_ sender: UIButton) {
        let signUpVC = Constants.Storyboards.main.instantiateViewController(identifier: "SignUpViewController") as! SignUpViewController
        navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    @IBAction func guestUserBtnClicked(_ sender: CustomButton) {
                
        Constants.singleton.isGuestLogin = true

        
        let dashboardVC = Constants.Storyboards.main.instantiateViewController(identifier: "TabBarViewController") as! TabBarViewController
        self.navigationController?.pushViewController(dashboardVC, animated: true)
        
//        let guestUserVC = Constants.Storyboards.main.instantiateViewController(identifier: "GuestUserViewController") as! GuestUserViewController
//        navigationController?.pushViewController(guestUserVC, animated: true)
    }
    
    @IBAction func languageSelectionAction(_ sender: CustomButton) {
        hideShowLanguageSelectionView()
    }
    
    @IBAction func englishBtnClicked(_ sender: UIButton) {
        langBtn.setTitle("English".localised(), for: .normal)
        restartApplication(extStr: "en", langStr: "English")
        hideShowLanguageSelectionView()
    }
    @IBAction func portugueseBtnClicked(_ sender: UIButton) {
        langBtn.setTitle("Portuguase", for: .normal)
        restartApplication(extStr: "pt-PT", langStr: "Portuguase")
        hideShowLanguageSelectionView()
    }
}
