//
//  AlertPopViewController.swift
//  Fitness
//
//  Created by Sagar Ranshur on 05/05/20.
//  Copyright © 2020 Sagar Ranshur. All rights reserved.
//

import UIKit
import DropDown

class AlertPopViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var heightBaseView: UIView!
    @IBOutlet weak var selectContentNameLbl: UILabel!
    @IBOutlet weak var seelctHeightBaseView: UIView!
    @IBOutlet weak var selectHeightLabel: UILabel!
    @IBOutlet weak var pickerView1: UIPickerView!
    @IBOutlet weak var pickerView2: UIPickerView!
    @IBOutlet weak var pickerView3: UIPickerView!
    @IBOutlet weak var unitLabel: UILabel!
    @IBOutlet weak var pickerViewBaseView: UIView!
    @IBOutlet weak var centerDotlabel: UILabel!
    
    @IBOutlet weak var HeightBaseViewTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var baseViewTopConstriant: NSLayoutConstraint!
    
    var didDateSelectionCompleted:((_ selectedDateString: String) -> ())?
    
    var selectedComponent = ""
    var selectedComponentValue = ""
    
    var selectedContentElement = ""
    var selectedContentSubElement = ""

    var dataArray: [String] = Constants.HardcodedData.monthsArray
    var dataIntArray = [Int]()
    var dataSubIntArray = [Int]()

    var pickerView1Array = [String]()
    var pickerView2Array = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.datePickerMode = .date
        datePicker.maximumDate = Date()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        setUpView()
    }
    
    func setUpView(){
        
        if selectedComponent == "Month".localised() {
            UIView.animate(withDuration: 0.5) {
                self.baseViewTopConstriant.constant = 1000
                self.HeightBaseViewTopConstraint.constant = 20
                
                self.selectContentNameLbl.text = "Select Month".localised()
                self.pickerView1Array = self.dataArray
                self.pickerView1.reloadAllComponents()
            }
        }else if selectedComponent == "Year".localised() {
            UIView.animate(withDuration: 0.5) {
                self.baseViewTopConstriant.constant = 1000
                self.HeightBaseViewTopConstraint.constant = 20
                
                self.selectContentNameLbl.text = "Select Year".localised()
                self.pickerView1Array = Constants.HardcodedData.yearArray
                self.pickerView1.reloadAllComponents()
            }
        }else if selectedComponent == "Weight".localised() {
            UIView.animate(withDuration: 0.5) {
                self.baseViewTopConstriant.constant = 1000
                self.HeightBaseViewTopConstraint.constant = 20
                
                self.selectContentNameLbl.text = "Select Weight".localised()
                self.selectHeightLabel.text = "Kilograms"
                self.selectedComponentValue = "Kilograms"
                 
                self.dataIntArray += 1...500
                let newArray = self.dataIntArray.map { (a) -> String in
                      return String(a) + " kg"
                  }
                self.pickerView1Array = newArray
                
                self.dataSubIntArray += 0...9
                let newArray1 = self.dataSubIntArray.map { (a) -> String in
                      return String(a) + " gm"
                  }
                self.pickerView2Array = newArray1
                self.pickerView1.reloadAllComponents()

            }
        }else if selectedComponent == "Height" {
            UIView.animate(withDuration: 0.5) {
                self.baseViewTopConstriant.constant = 1000
                self.HeightBaseViewTopConstraint.constant = 20
                
                self.selectContentNameLbl.text = "Select Height"
                self.selectHeightLabel.text = "Centimeters"
                self.selectedComponentValue = "Centimeters"
                
                self.dataIntArray += 1...272
                let newArray = self.dataIntArray.map { (a) -> String in
                      return String(a) + " cm"
                }
                
                self.pickerView1Array = newArray
                self.pickerView1.reloadAllComponents()
            }
        }
        self.view.layoutIfNeeded()
    }
    
    
    @IBAction func backButtonClicked(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelBtnClicked(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveBtnClicked(_ sender: CustomButton) {
        
        if selectedComponent == "Month".localised() {
            
            self.didDateSelectionCompleted!(selectedContentElement)
            dismiss(animated: true, completion: nil)
            
        }else if selectedComponent == "Year".localised() {
            
            self.didDateSelectionCompleted!(selectedContentElement)
            dismiss(animated: true, completion: nil)
            
        }else if selectedComponent == "Height" {
            
            self.didDateSelectionCompleted!(getSelectedHeightWeightValue())
            dismiss(animated: true, completion: nil)

        }else if selectedComponent == "Weight" {
            self.didDateSelectionCompleted!(getSelectedHeightWeightValue())
            dismiss(animated: true, completion: nil)

        }
    }
    
    func getSelectedHeightWeightValue() -> String {
        
        var newValue = ""
        
        if selectedComponentValue == "Kilograms" {
            if selectedContentElement != "" {
                if selectedContentSubElement != "" {
                    newValue = selectedContentElement + " " + selectedContentSubElement
                }else {
                    newValue = selectedContentElement
                }
            }else {
                self.selectedContentElement = "1 kg"
                self.selectedContentSubElement = "0 gm"
                newValue = selectedContentElement + " " + selectedContentSubElement

            }
        }else if selectedComponentValue == "Stones" {
            if selectedContentElement != "" {
                if selectedContentSubElement != "" {
                    newValue = selectedContentElement + " " + selectedContentSubElement
                }else {
                    newValue = selectedContentElement
                }
            }else {
                self.selectedContentElement = "1 st"
                self.selectedContentSubElement = "0 lb"
                newValue = selectedContentElement + " " + selectedContentSubElement

            }
        } else if selectedComponentValue == "Pounds" {
            if selectedContentElement != "" {
                if selectedContentSubElement != "" {
                    newValue = selectedContentElement + " " + selectedContentSubElement + " lb"
                }else {
                    newValue = selectedContentElement + " lb"
                }
            }else {
                self.selectedContentElement = "1"
                self.selectedContentSubElement = "0"
                newValue = selectedContentElement + " " + selectedContentSubElement + " lb"

            }
        }else if selectedComponentValue == "Centimeters" {
            if selectedContentElement != "" {
                if selectedContentSubElement != "" {
                    newValue = selectedContentElement + " " + selectedContentSubElement
                }else {
                    newValue = selectedContentElement
                }
            }else {
                self.selectedContentElement = "30 cm"
                self.selectedContentSubElement = ""
                newValue = selectedContentElement + " " + selectedContentSubElement

            }
        }
        else if selectedComponentValue == "Feet & Inches" {
            if selectedContentElement != "" {
                if selectedContentSubElement != "" {
                    newValue = selectedContentElement + " " + selectedContentSubElement
                }else {
                    newValue = selectedContentElement
                }
            }else {
                self.selectedContentElement = "1 ft"
                self.selectedContentSubElement = "0 in"
                newValue = selectedContentElement + " " + selectedContentSubElement
            }
        }
        
        return newValue
    }
    
    @IBAction func selectHeightUnitClicked(_ sender: UITapGestureRecognizer) {
        var data = [String]()
        if selectedComponent == "Height" {
            data = ["Centimeters","Feet & Inches"]
        }else if selectedComponent == "Weight"{
            data = ["Kilograms","Stones","Pounds"]
        }
        let dropDown = DropDown()
        dropDown.anchorView = self.heightBaseView // UIView or UIBarButtonItem
        dropDown.width = self.heightBaseView.frame.size.width
        dropDown.direction = .top
        dropDown.bottomOffset = CGPoint.init(x: self.heightBaseView.frame.origin.x, y: self.heightBaseView.frame.origin.y)
        
        // The list of items to display. Can be changed dynamically
        dropDown.dataSource = data
        dropDown.selectionAction = { (index: Int, item: String) in
            
            if self.selectedComponent == "Weight" {
                self.handleWeightSelection(item: item)
            }else if self.selectedComponent == "Height" {
                self.handleHeightSelection(item: item)
            }
        }
        dropDown.show()
    }
    
    func handleHeightSelection(item: String) {
        self.selectHeightLabel.text = item

        if item == "Centimeters" {
            self.dataIntArray += 30...272
            let newArray = self.dataIntArray.map { (a) -> String in
                return String(a) + " cm"
            }
            self.unitLabel.text = ""
            self.pickerView1Array = newArray
            
        }else if item == "Feet & Inches" {
            
            self.dataIntArray += 1...8
            let newArray = self.dataIntArray.map { (a) -> String in
                return String(a) + " ft"
            }
            self.pickerView1Array = newArray
            
            self.dataSubIntArray += 0...11
            let newArray1 = self.dataSubIntArray.map { (a) -> String in
                return String(a) + " in"
            }
            self.unitLabel.text = ""
            self.pickerView2Array = newArray1
            
        }
        self.selectedComponentValue = item
        self.pickerView1.reloadAllComponents()
    }
    
    func handleWeightSelection(item: String) {
        
        self.selectHeightLabel.text = item
        
        if item == "Kilograms" {
            self.dataIntArray += 1...500
            let newArray = self.dataIntArray.map { (a) -> String in
                return String(a) + " kg"
            }
            self.pickerView1Array = newArray
            
            self.dataSubIntArray += 0...9
            let newArray1 = self.dataSubIntArray.map { (a) -> String in
                return String(a) + " gm"
            }
            self.unitLabel.text = ""
            self.pickerView2Array = newArray1
            

            
        }else if item == "Stones" {
            
            self.dataIntArray += 1...100
            let newArray = self.dataIntArray.map { (a) -> String in
                return String(a) + " st"
            }
            self.pickerView1Array = newArray
            
            self.dataSubIntArray += 0...9
            let newArray1 = self.dataSubIntArray.map { (a) -> String in
                return String(a) + " lb"
            }
            self.unitLabel.text = ""
            self.pickerView2Array = newArray1
            
        }else if item == "Pounds" {
            self.dataIntArray += 1...500
            let newArray = self.dataIntArray.map { (a) -> String in
                return String(a)
            }
            self.pickerView1Array = newArray
            
            self.dataSubIntArray += 0...9
            let newArray1 = self.dataSubIntArray.map { (a) -> String in
                return String(a)
            }
            self.unitLabel.text = "lb"
            self.pickerView2Array = newArray1
            
        }
        
        self.pickerView1.reloadAllComponents()
        self.selectedComponentValue = item
    }
}

extension AlertPopViewController : UIPickerViewDelegate,UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if selectedComponent == "Weight" {
            return 2
        }else if selectedComponent == "Height" {
            if selectedComponentValue == "Centimeters" {
                return 1
            }else {
                return 2
            }
        }else {
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if selectedComponent == "Weight" {
            if component == 0 {
                return pickerView1Array.count
            }else if component == 1 {
                return pickerView2Array.count
            }
        }else if selectedComponent == "Height" {
            if selectedComponentValue == "Centimeters" {
                return pickerView1Array.count
            }else {
                if component == 0 {
                    return pickerView1Array.count
                }else if component == 1 {
                    return pickerView2Array.count
                }
            }
        }else {
            return pickerView1Array.count
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if selectedComponent == "Height" {
            if selectedComponentValue == "Centimeters" {
                return pickerView1Array[row]
            }else {
                if component == 0 {
                    return pickerView1Array[row]
                }else if component == 1 {
                    return pickerView2Array[row]
                }
            }
        }else {
            if component == 0 {
                return pickerView1Array[row]
            }else if component == 1 {
                return pickerView2Array[row]
            }
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if selectedComponent == "Weight" {
            if component == 0 {
                selectedContentElement = pickerView1Array[row]
            }else if component == 1 {
                selectedContentSubElement = pickerView2Array[row]
            }
            
        }else if selectedComponent == "Height" {
            if selectedComponentValue == "Centimeters" {
                selectedContentElement = pickerView1Array[row]
            }else {
                if component == 0 {
                    selectedContentElement = pickerView1Array[row]
                }else if component == 1 {
                    selectedContentSubElement = pickerView2Array[row]
                }
            }
        }else {
            selectedContentElement = pickerView1Array[row]
        }
    }
}
