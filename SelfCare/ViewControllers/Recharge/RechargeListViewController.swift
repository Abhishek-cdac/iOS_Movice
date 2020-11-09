//
//  RechargeListViewController.swift
//  SelfCare
//
//  Created by Sagar Ranshur on 12/05/20.
//  Copyright © 2020 Sagar Ranshur. All rights reserved.
//

import UIKit

class RechargeListViewController: UIViewController, GuestLoginDelegate {
    
    @IBOutlet weak var segment1Label: UILabel!
    @IBOutlet weak var segment1BottomView: UIView!
    @IBOutlet weak var segment2Label: UILabel!
    @IBOutlet weak var segment2BottomView: UIView!
    @IBOutlet weak var segment3Label: UILabel!
    @IBOutlet weak var segment3BottomView: UIView!
    @IBOutlet weak var segment4Label: UILabel!
    @IBOutlet weak var segment4BottomView: UIView!
    
    @IBOutlet weak var mobileNoLabel: UILabel!
    @IBOutlet weak var backBtnImage: UIImageView!
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var rechargeDataTableView: UITableView!
    
    var isHighlighted = false
    
    struct RechargeData {
        var plans: String = ""
        var validity: String = ""
        var benefits: String = ""
        var isPlanSelected: Bool = false
        
        init(plans: String, validity: String, benefits: String, isChoosedPlan: Bool) {
            self.plans = plans
            self.validity = validity
            self.benefits = benefits
            self.isPlanSelected = isChoosedPlan
        }
    }
    
    var dataArray = [RechargeData]()
    
    var rechargeDataArray: [RechargeData] = [
        RechargeData.init(plans: "Kz 2020", validity: "365 Days", benefits: "Unlimited 547.5 GB", isChoosedPlan: true),
        RechargeData.init(plans: "Kz 555", validity: "84 Days", benefits: "Unlimited 150.5 GB", isChoosedPlan: true),
        RechargeData.init(plans: "Kz 442", validity: "365 Days", benefits: "Unlimited 547.5 GB", isChoosedPlan: true),
        RechargeData.init(plans: "Kz 333", validity: "84 Days", benefits: "Unlimited 150.5 GB", isChoosedPlan: true),
        RechargeData.init(plans: "Kz 0200", validity: "365 Days", benefits: "Unlimited 547.5 GB", isChoosedPlan: true),
        RechargeData.init(plans: "Kz 150", validity: "365 Days", benefits: "Unlimited 547.5 GB", isChoosedPlan: true),
    ]
    
    var popularDataPacks: [RechargeData] = [
        RechargeData.init(plans: "Kz 2020", validity: "365 Days", benefits: "Unlimited 547.5 GB", isChoosedPlan: true),
        RechargeData.init(plans: "Kz 555", validity: "84 Days", benefits: "Unlimited 150.5 GB", isChoosedPlan: true),
        RechargeData.init(plans: "Kz 422", validity: "365 Days", benefits: "Unlimited 547.5 GB", isChoosedPlan: true)
    ]
    
    var topupDataPacks: [RechargeData] = [
        RechargeData.init(plans: "Kz 10", validity: "Unlimited", benefits: "Kz 7.47 Talktime", isChoosedPlan: true),
        RechargeData.init(plans: "Kz 50", validity: "Unlimited", benefits: "Kz 17.47 Talktime", isChoosedPlan: true),
        RechargeData.init(plans: "Kz 100", validity: "Unlimited", benefits: "Kz 17.47 Talktime", isChoosedPlan: true)
    ]
    
    var data4GArray: [RechargeData] = [
           RechargeData.init(plans: "Kz 11", validity: "Existing Plan", benefits: "400 MB", isChoosedPlan: true),
           RechargeData.init(plans: "Kz 21", validity: "Existing Plan", benefits: "1 GB", isChoosedPlan: true),
           RechargeData.init(plans: "Kz 101", validity: "Existing Plan", benefits: "20 GB", isChoosedPlan: true)
       ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(true, animated: true)
        
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
    
    func setUpView() {
        //prepare hardcoded data for Recharge display
        mobileNoLabel.text = Constants.singleton.contactNo
        
        dataArray = rechargeDataArray
        rechargeDataTableView.reloadData()
    }
    
    //MARK: - UITapgesture handler methods
    //MARK: -
    
    @IBAction func segment1Clicked(_ sender: UITapGestureRecognizer) {
        
        segment1Label.textColor = UIColor.init(hexString: Constants.HexColors.activeColor)
        segment1BottomView.backgroundColor = UIColor.init(hexString: Constants.HexColors.activeColor)
        
        segment2Label.textColor = .gray
        segment2BottomView.backgroundColor = .clear
        segment3Label.textColor = .gray
        segment3BottomView.backgroundColor = .clear
        segment4Label.textColor = .gray
        segment4BottomView.backgroundColor = .clear
        
        dataArray = []
        dataArray = rechargeDataArray
        rechargeDataTableView.reloadData()
    }
    
    @IBAction func segment2Clicked(_ sender: UITapGestureRecognizer) {
        
        segment2Label.textColor = UIColor.init(hexString: Constants.HexColors.activeColor)
        segment2BottomView.backgroundColor = UIColor.init(hexString: Constants.HexColors.activeColor)
        
        segment1Label.textColor = .gray
        segment1BottomView.backgroundColor = .clear
        segment3Label.textColor = .gray
        segment3BottomView.backgroundColor = .clear
        segment4Label.textColor = .gray
        segment4BottomView.backgroundColor = .clear
        
        dataArray = []

        dataArray = popularDataPacks
        rechargeDataTableView.reloadData()
    }

    @IBAction func segment3Clicked(_ sender: UITapGestureRecognizer) {
        
        segment3Label.textColor = UIColor.init(hexString: Constants.HexColors.activeColor)
        segment3BottomView.backgroundColor = UIColor.init(hexString: Constants.HexColors.activeColor)
        
        segment1Label.textColor = .gray
        segment1BottomView.backgroundColor = .clear
        segment2Label.textColor = .gray
        segment2BottomView.backgroundColor = .clear
        segment4Label.textColor = .gray
        segment4BottomView.backgroundColor = .clear
        
        dataArray = []

        dataArray = topupDataPacks
        rechargeDataTableView.reloadData()
    }

    @IBAction func segment4Clicked(_ sender: UITapGestureRecognizer) {
        
        segment4Label.textColor = UIColor.init(hexString: Constants.HexColors.activeColor)
        segment4BottomView.backgroundColor = UIColor.init(hexString: Constants.HexColors.activeColor)
        
        segment1Label.textColor = .gray
        segment1BottomView.backgroundColor = .clear
        segment2Label.textColor = .gray
        segment2BottomView.backgroundColor = .clear
        segment3Label.textColor = .gray
        segment3BottomView.backgroundColor = .clear
        
        dataArray = []

        dataArray = data4GArray
        rechargeDataTableView.reloadData()

    }
    
    //MARK: - Button Clicked Action
    //MARK: -
    @IBAction func buyBtnClicked(_ sender: UIButton) {
        
        if Constants.singleton.isGuestLogin {
            
            let viewController = Constants.Storyboards.main.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            viewController.isFromBuyNow = true
            viewController.guestLoginDelegate = self
            self.present(viewController, animated: true, completion: nil)
            
        }else {
            let paymentVC = Constants.Storyboards.main.instantiateViewController(identifier: "PaymentOptionsVC") as! PaymentOptionsVC
            self.navigationController?.pushViewController(paymentVC, animated: true)
        }
    }
    
    //MARK: - Login Completed
    //MARK: -
    func loginCompleted() {
        
        let paymentVC = Constants.Storyboards.main.instantiateViewController(identifier: "PaymentOptionsVC") as! PaymentOptionsVC
        self.navigationController?.pushViewController(paymentVC, animated: true)
    }

    @IBAction func backBtnClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension RechargeListViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = rechargeDataTableView.dequeueReusableCell(withIdentifier: "cell") as! RechargeTableViewCell
                
        (indexPath.row % 2 == 0) ? (cell.baseView.backgroundColor = .systemGray5) : (cell.baseView.backgroundColor = .white)
                        
        let rechargeObj = dataArray[indexPath.row]
        
        cell.planLabel.text = rechargeObj.plans
        cell.validityLabel.text = rechargeObj.validity
        cell.benefitsLabel.text = rechargeObj.benefits
        
        return cell
    }
        
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as! RechargeHeaderTableViewCell
        
        return headerCell
    }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
}
