//
//  LanguageSelectionVC.swift
//  SelfCare
//
//  Created by Sagar Ranshur on 20/05/20.
//  Copyright © 2020 Sagar Ranshur. All rights reserved.
//

import UIKit

class LanguageSelectionVC: UIViewController {

    @IBOutlet weak var englishBtnImage: UIImageView!
    @IBOutlet weak var portugueseBtnImage: UIImageView!
    @IBOutlet weak var closeBtn: UIButton!
    
    var selectedLanguage: ((String) -> ())?
//    var onCompletion: ((success: Bool) -> ())?

    var selectedLang = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        closeBtn.layer.cornerRadius = closeBtn.frame.width / 2
        closeBtn.layer.masksToBounds = false

        if selectedLang == "English".localised() || selectedLang == "" {
            englishBtnImage.isHighlighted = true
            portugueseBtnImage.isHighlighted = false
            selectedLang = "English".localised()
        }else if selectedLang == "Portuguese".localised() {
            englishBtnImage.isHighlighted = false
            portugueseBtnImage.isHighlighted = true
            selectedLang = "Portuguese".localised()
        }
        
    }
    
    @IBAction func continueBtnClicked(_ sender: CustomButton) {
        selectedLanguage?(selectedLang)
//        onCompletion?(success: true)
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(selectedLang, forKey: Constants.UserDefaults.selectedLanguage)
        userDefaults.synchronize()

//        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func closeBtnClicked(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func englishBtnClicked(_ sender: UITapGestureRecognizer) {
        englishBtnImage.isHighlighted = true
        portugueseBtnImage.isHighlighted = false
        selectedLang = "English".localised()

    }
    
    @IBAction func portugueseBtnClicked(_ sender: UITapGestureRecognizer) {
        englishBtnImage.isHighlighted = false
        portugueseBtnImage.isHighlighted = true
        selectedLang = "Portuguese".localised()
    }
}
