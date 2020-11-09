//
//  PaymentCardsVC.swift
//  SelfCare
//
//  Created by Sagar Ranshur on 13/05/20.
//  Copyright © 2020 Sagar Ranshur. All rights reserved.
//

import UIKit

class PaymentCardsVC: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var cardsBaseView: UIView!
    @IBOutlet weak var cardDetailsSubView: UIView!
    @IBOutlet weak var cardHolderNameLabel: UITextField!
    @IBOutlet weak var cardNumber: UITextField!
    @IBOutlet weak var selectedMonthLabel: UILabel!
    @IBOutlet weak var selectedYearLabel: UILabel!
    @IBOutlet weak var cvvTextField: UITextField!
    @IBOutlet weak var squareSelectionImage: UIImageView!
    @IBOutlet weak var circleSelectionImage: UIImageView!
    
    @IBOutlet weak var mobileNoTxt: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpView()
    }
    
    func setUpView() {
        cardsBaseView.elevate(elevation: 2)
        cardDetailsSubView.elevate(elevation: 2)
        mobileNoTxt.text = Constants.singleton.contactNo
        
        
        //custom alert delegate
        Utility.customAlertView.delegate = self
        
        let keyboardDoneButtonView = UIToolbar.init()
        keyboardDoneButtonView.sizeToFit()
        let doneButton = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonItem.SystemItem.done,
                                                           target: self,
                                                           action: #selector(doneClicked(sender:)))

        keyboardDoneButtonView.items = [doneButton]
        cvvTextField.inputAccessoryView = keyboardDoneButtonView
    }
    
    @objc func doneClicked(sender: AnyObject) {
      self.view.endEditing(true)
    }
    
    //MARK: - Field Validations Methods
    //MARK: -
    
    func validateFields() -> Bool {
        if !circleSelectionImage.isHighlighted {
            Utility.setUpAlert(isSingle: true, isSuccessAlert: false, title: "Validation Message", message: "Please check card options", image: "warning")
            Utility.showCustomAlert()
            return false
        }else if cardHolderNameLabel.text!.isEmpty {
            Utility.setUpAlert(isSingle: true, isSuccessAlert: false, title: "Validation Message", message: "Please enter card holder's name" , image: "warning")
            Utility.showCustomAlert()
            return false
        }else if (cardHolderNameLabel.text?.split(separator: " ").count)! <= 2   {
            Utility.setUpAlert(isSingle: true, isSuccessAlert: false, title: "Validation Message", message: "Please enter valid card holder's name" , image: "warning")
            Utility.showCustomAlert()
            return false
        }
        return true
    }
    
    
    //MARK: - UITextField delegate methods
    //MARK: -
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        

        if textField == cardNumber {

        }
        return true
    }
    
    //MARK: - Button Clicked
    //MARK: -
    @IBAction func nextBtnClicked(_ sender: CustomButton) {
        if validateFields() {
            let successVC = Constants.Storyboards.main.instantiateViewController(identifier: "PaymentSuccessViewController") as! PaymentSuccessViewController
            self.navigationController?.pushViewController(successVC, animated: true)
        }
    }
    
    @IBAction func monthViewTapped(_ sender: UITapGestureRecognizer) {
        
        let alertPopVC = Constants.Storyboards.main.instantiateViewController(identifier: "AlertPopViewController") as! AlertPopViewController
        
        alertPopVC.selectedComponent = "Month".localised()
        alertPopVC.didDateSelectionCompleted = {selectedMonth in
        
            self.selectedMonthLabel.text = selectedMonth
        }
        
        self.present(alertPopVC, animated: true, completion: nil)
        
    }
    
    @IBAction func yearViewTapped(_ sender: UITapGestureRecognizer) {
        let alertPopVC = Constants.Storyboards.main.instantiateViewController(identifier: "AlertPopViewController") as! AlertPopViewController
        
        alertPopVC.selectedComponent = "Year".localised()
        alertPopVC.didDateSelectionCompleted = {selectedYear in
            
            self.selectedYearLabel.text = selectedYear
        }
        
        self.present(alertPopVC, animated: true, completion: nil)
    }
    
    @IBAction func checkSelectedClicked(_ sender: UITapGestureRecognizer) {
        if squareSelectionImage.isHighlighted {
            squareSelectionImage.isHighlighted = false
        }else {
            squareSelectionImage.isHighlighted = true
        }
    }
    
    @IBAction func circleSelectionTapped(_ sender: UITapGestureRecognizer) {
        if circleSelectionImage.isHighlighted {
            circleSelectionImage.isHighlighted = false
        }else {
            circleSelectionImage.isHighlighted = true
        }
    }
    
    @IBAction func backBtnClicked(_ sender: UITapGestureRecognizer) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension PaymentCardsVC: CustomAlertDelegate {
    func okButtonClicked() {
        Utility.removeAlert()
    }
    
    func cancelButtonClicked() {
        Utility.removeAlert()
    }
    
    func centeredButtonClicked() {
        Utility.removeAlert()
    }
}

