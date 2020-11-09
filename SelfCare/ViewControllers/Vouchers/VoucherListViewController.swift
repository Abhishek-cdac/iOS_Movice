//
//  VoucherListViewController.swift
//  SelfCare
//
//  Created by Sagar Ranshur on 13/05/20.
//  Copyright © 2020 Sagar Ranshur. All rights reserved.
//

import UIKit

class VoucherListViewController: UIViewController,GuestLoginDelegate {
        
    @IBOutlet weak var viewLabel: UILabel!
    @IBOutlet weak var viewBottomView: UIView!
    @IBOutlet weak var buyLabel: UILabel!
    @IBOutlet weak var buyBottomView: UIView!
    @IBOutlet weak var historyLabel: UILabel!
    @IBOutlet weak var historyBottomView: UIView!
    @IBOutlet weak var voucherListingTableView: UITableView!
    @IBOutlet weak var buyNowBtn: UIButton!
    
    @IBOutlet weak var mobileNoLabel: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var backBtnImage: UIImageView!
    
    
    var selectedSegment = "View".localised()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mobileNoLabel.text = Constants.singleton.contactNo
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        if (tabBarController != nil) && !(tabBarController?.tabBar.isHidden)!{
            //visible
            backBtn.isUserInteractionEnabled = false
            backBtn.isHidden = true
            backBtnImage.isHidden = true
        }else {
            backBtn.isUserInteractionEnabled = true
            backBtn.isHidden = false
            backBtnImage.isHidden = false
        }

    }
    
    //MARK: Action Method
    //MARK:
    
    @IBAction func view1Clicked(_ sender: UITapGestureRecognizer) {
        viewBottomView.backgroundColor = UIColor.init(hexString: Constants.HexColors.activeColor)
        viewLabel.tintColor = UIColor.init(hexString: Constants.HexColors.activeColor)
        buyLabel.textColor = UIColor.gray
        buyBottomView.backgroundColor = UIColor.clear
        historyLabel.textColor = UIColor.gray
        historyBottomView.backgroundColor = UIColor.clear
        
        selectedSegment = "View".localised()
        voucherListingTableView.reloadData()
        buyNowBtn.isHidden = true

    }
    
    @IBAction func view2Clicked(_ sender: UITapGestureRecognizer) {
        viewBottomView.backgroundColor = UIColor.clear
        viewLabel.textColor = UIColor.gray
        buyLabel.textColor = UIColor.init(hexString: Constants.HexColors.activeColor)
        buyBottomView.backgroundColor = UIColor.init(hexString: Constants.HexColors.activeColor)
        historyLabel.textColor = UIColor.gray
        historyBottomView.backgroundColor = UIColor.clear
        
        selectedSegment = "Buy".localised()
        voucherListingTableView.reloadData()
        buyNowBtn.isHidden = false

    }
    
    @IBAction func view3Clicked(_ sender: UITapGestureRecognizer) {
        viewBottomView.backgroundColor = UIColor.clear
        viewLabel.textColor = UIColor.gray
        buyLabel.textColor = UIColor.gray
        buyBottomView.backgroundColor = UIColor.clear
        historyLabel.textColor = UIColor.init(hexString: Constants.HexColors.activeColor)
        historyBottomView.backgroundColor = UIColor.init(hexString: Constants.HexColors.activeColor)
        
        buyNowBtn.isHidden = true
        selectedSegment = "History".localised()
        voucherListingTableView.reloadData()
    }
    
    @IBAction func buyNowBtnClicked(_ sender: UIButton) {
        
        if Constants.singleton.isGuestLogin {
            
            let viewController = Constants.Storyboards.main.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            viewController.isFromBuyNow = true
            viewController.guestLoginDelegate = self
            self.navigationController?.present(viewController, animated: true, completion: nil)

        }else {
            let paymentOptionsVC = Constants.Storyboards.main.instantiateViewController(identifier: "PaymentOptionsVC") as! PaymentOptionsVC
            self.navigationController?.pushViewController(paymentOptionsVC, animated: true)
        }
    }
    
    @IBAction func backBtnClicked(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Login Delegate Methods
    //MARK: -
    func loginCompleted() {
        let paymentOptionsVC = Constants.Storyboards.main.instantiateViewController(identifier: "PaymentOptionsVC") as! PaymentOptionsVC
        self.navigationController?.pushViewController(paymentOptionsVC, animated: true)
    }

}

extension VoucherListViewController: UITableViewDelegate,UITableViewDataSource,VoucherBuyDelegate {
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if selectedSegment == "View".localised() {
            return 3
        }else if selectedSegment == "Buy".localised() {
            return 4
        }else if selectedSegment == "History".localised() {
            return 3
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tableCell = UITableViewCell.init()
        
        if selectedSegment == "View".localised() {
            
            let cell = voucherListingTableView.dequeueReusableCell(withIdentifier: "cell") as! VoucherCustomTableCell
            
            if indexPath.row == 0 {
                cell.selectBtn.tintColor = UIColor.init(hexString: Constants.HexColors.activeColor)
                cell.selectBtn.borderColor = UIColor.init(hexString: Constants.HexColors.activeColor)
                cell.transferableLabel.textColor = UIColor.init(hexString: Constants.HexColors.activeColor)
                cell.quantityLabel.textColor = UIColor.init(hexString: Constants.HexColors.activeColor)
            }else {
                cell.selectBtn.tintColor = UIColor.gray
                cell.selectBtn.borderColor = UIColor.gray
                cell.transferableLabel.textColor = UIColor.gray
                cell.quantityLabel.textColor = UIColor.gray
            }
            
            return cell
        }else if selectedSegment == "Buy".localised() {
            let cell = voucherListingTableView.dequeueReusableCell(withIdentifier: "buyCell") as! VoucherBuyCustomTableCell
            cell.index = indexPath
            cell.buyDelegate = self
            return cell
        }else if selectedSegment == "History".localised() {
            let cell = voucherListingTableView.dequeueReusableCell(withIdentifier: "historyCell") as! VoucherHistoryTableViewCell

            return cell
        }
        
        return tableCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if selectedSegment == "View".localised() {
            return 120
        }else if selectedSegment == "Buy".localised() {
            return 105
        }else if selectedSegment == "History".localised() {
            return 115
        }
        return 100
    }
    
    func selectionButtonMethod(indexPath: IndexPath) {
        let cell = voucherListingTableView.cellForRow(at: indexPath) as! VoucherBuyCustomTableCell
        if cell.selectionBtn.backgroundColor != UIColor.red {
            cell.selectionBtn.backgroundColor = UIColor.red
        }else {
            cell.selectionBtn.backgroundColor = UIColor.white
        }

    }

}
