//
//  CustomTextField.swift
//  CustomField
//
//  Created by Sagar Ranshur on 21/04/20.
//  Copyright © 2020 Sagar Ranshur. All rights reserved.
//

import UIKit

class CustomTextField: UIView, UITextFieldDelegate {

    @IBOutlet weak var textBaseView: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var placeHolderLabel: UILabel!
    @IBOutlet weak var underlineView: UIView!
    @IBOutlet weak var errorMsg: UILabel!
    
    @IBInspectable var placeHolder: String = "" {
        didSet {
            self.textField.placeholder = placeHolder
        }
    }
    
    @IBInspectable var activeColor : UIColor = .black {
        didSet {
            self.placeHolderLabel.textColor = activeColor
            self.textField.textColor = activeColor
        }
    }
    
    var selectionColor : UIColor?
    var underlineColor : UIColor?
    var errorColor : UIColor?

    let nibName = "CustomTextField"
    
    
    var contentView : UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        // When wants to load from UIView, then write into init with coder
        guard let view = loadFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
        contentView = view
        customSetUp()
    }
    
    //Loading From Nib
    func loadFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    func customSetUp() {
        placeHolderLabel.text = ""
        underlineView.backgroundColor = activeColor
        textField.placeholder = placeHolder
        textField.delegate = self
        hideErrorMessage()

        textField.addTarget(self, action: #selector(self.textDidChange(_:)), for: .editingChanged)
    }
    
    func changeTextProperties() {
        placeHolderLabel.text = placeHolder
        placeHolderLabel.textColor = activeColor
        underlineView.backgroundColor = activeColor
        textField.textColor = activeColor
        hideErrorMessage()
    }
    
    func resetTextField() {
        placeHolderLabel.text = ""
        underlineView.backgroundColor = activeColor
        textField.textColor = activeColor
        textField.placeholder = placeHolder
        hideErrorMessage()
    }
    
    //MARK: - Show/Hide Error Message
    //MARK: -
    
    func showErrorMessage(errorMessage : String) {
        errorMsg.textColor = .red
        errorMsg.text = errorMessage
    }
    
    func hideErrorMessage() {
        errorMsg.textColor = .clear
        errorMsg.text = ""
    }

    //MARK: - Text field delegate methods
    //MARK: -
    func textFieldDidBeginEditing(_ textField: UITextField) {
        changeTextProperties()
    }
    
    @objc func textDidChange(_ textField: UITextField) {
        if textField.text?.count == 0 {
            resetTextField()
        }else {
            changeTextProperties()
        }
    }
}
