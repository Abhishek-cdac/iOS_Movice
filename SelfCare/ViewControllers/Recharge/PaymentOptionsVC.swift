//
//  PaymentOptionsVC.swift
//  SelfCare
//
//  Created by Sagar Ranshur on 12/05/20.
//  Copyright © 2020 Sagar Ranshur. All rights reserved.
//

import UIKit

class PaymentOptionsVC: UIViewController {

    @IBOutlet weak var paymentOptionsTableView: UITableView!
    
    var paymentOptions = ["Debit Card/ATM".localised(), "Net Banking".localised(), "Credit Card".localised()]
    
    @IBOutlet weak var mobileNoText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mobileNoText.text = Constants.singleton.contactNo
    }
    
    @IBAction func backBtnClicked(_ sender: UITapGestureRecognizer) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension PaymentOptionsVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return paymentOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = paymentOptionsTableView.dequeueReusableCell(withIdentifier: "cell") as! PaymentOptionsCell
        
        cell.optionLabel.text = paymentOptions[indexPath.row]
                
        cell.selectionImage.layer.cornerRadius = cell.selectionImage.frame.width / 2
        cell.selectionImage.layer.masksToBounds = false
        cell.selectionImage.borderWidth = 1
        cell.selectionImage.borderColor = UIColor.init(hexString: Constants.HexColors.activeColor)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cardsVC = Constants.Storyboards.main.instantiateViewController(identifier: "PaymentCardsVC") as! PaymentCardsVC
        self.navigationController?.pushViewController(cardsVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
