//
//  DashboardVC.swift
//  SelfCare
//
//  Created by Sagar Ranshur on 11/05/20.
//  Copyright © 2020 Sagar Ranshur. All rights reserved.
//

import UIKit

class DashboardVC: UIViewController {

    @IBOutlet weak var sideBarLeadingConstriant: NSLayoutConstraint!
    @IBOutlet weak var sideMenuBaseView: UIView!
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var promotionCollectionView: UICollectionView!
    
    @IBOutlet weak var mobileNoLabel: UILabel!
    @IBOutlet weak var usernameLable: UILabel!
    @IBOutlet weak var gmailLabel: UILabel!
    @IBOutlet weak var logoutBaseView: UIView!
    
    var promotionArray = ["promotion4","promotion4","promotion4"]
    var isSideBarHidden = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpView()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        
        self.sideBarLeadingConstriant.constant = -750
        self.isSideBarHidden = !self.isSideBarHidden
        self.baseView.isUserInteractionEnabled = false
    }
    
    func setUpView() {
        sideMenuBaseView.elevate(elevation: 2.0)
        
        if Constants.singleton.isGuestLogin {
            
            usernameLable.text = "Welcome Guest".localised()
            gmailLabel.text = ""
            
            if Constants.singleton.contactNo != "" {
                logoutBaseView.isHidden = false
            }else {
                logoutBaseView.isHidden = true
            }
            
        }else {
            if Constants.singleton.userNameStr != "" {
                usernameLable.text = Constants.singleton.userNameStr
            }else {
                usernameLable.text = "Welcome User".localised()
            }
            gmailLabel.text = Constants.singleton.emailIdStr
            logoutBaseView.isHidden = false

        }
        
        mobileNoLabel.text = Constants.singleton.contactNo
    }
    
    @IBAction func sideMenuClicked(_ sender: UITapGestureRecognizer) {
        showHideSideBarMenu()
    }
    
    func showHideSideBarMenu() {
        if !isSideBarHidden {
            //show
            UIView.animate(withDuration: 0.5) {
                self.sideBarLeadingConstriant.constant = 0
                self.isSideBarHidden = !self.isSideBarHidden
                self.baseView.isUserInteractionEnabled = true
                self.view.layoutIfNeeded()
            }
        }else {
            //hide
            UIView.animate(withDuration: 0.5) {
                self.sideBarLeadingConstriant.constant = -750
                self.isSideBarHidden = !self.isSideBarHidden
                self.baseView.isUserInteractionEnabled = false
                self.view.layoutIfNeeded()
            }
        }
    }
    
    //MARK: - Button Action Method
    //MARK: -
    
    @IBAction func baseViewClicked(_ sender: UITapGestureRecognizer) {
        showHideSideBarMenu()
    }
    
    @IBAction func rechargeOptionTapped(_ sender: UITapGestureRecognizer) {
        let rechargeVC = Constants.Storyboards.main.instantiateViewController(identifier: "RechargeListViewController") as! RechargeListViewController
        self.navigationController?.pushViewController(rechargeVC, animated: true)
    }
    
    @IBAction func myVoucherViewTapped(_ sender: UITapGestureRecognizer) {
        let voucherVC = Constants.Storyboards.main.instantiateViewController(identifier: "VoucherListViewController") as! VoucherListViewController
        self.navigationController?.pushViewController(voucherVC, animated: true)
    }
    
    @IBAction func couponsMenuBtnClicked(_ sender: UITapGestureRecognizer) {
        
        let couponsVC = Constants.Storyboards.main.instantiateViewController(identifier: "CouponsVC") as! CouponsVC
        self.navigationController?.pushViewController(couponsVC, animated: true)
    }
    
    @IBAction func movicelCareMenuBtnClicked(_ sender: UITapGestureRecognizer) {
        let movicelCareVC = Constants.Storyboards.main.instantiateViewController(identifier: "MovicelCareVC") as! MovicelCareVC
        self.navigationController?.pushViewController(movicelCareVC, animated: true)
    }
    
    @IBAction func locateUsMenuBtnClicked(_ sender: UITapGestureRecognizer) {
        
        let movicelCareLocateVC = Constants.Storyboards.main.instantiateViewController(identifier: "MovicelCareLocateUsVC") as! MovicelCareLocateUsVC
        self.navigationController?.pushViewController(movicelCareLocateVC, animated: true)
    }
    
    @IBAction func searchBtnClicked(_ sender: UIButton) {
        let searchVC = Constants.Storyboards.main.instantiateViewController(identifier: "SearchViewController") as! SearchViewController
        self.present(searchVC, animated: true, completion: nil)
    }
    
    @IBAction func logoutSideMenuOptionClicked(_ sender: UITapGestureRecognizer) {
        
        Constants.singleton.isGuestLogin = false
        Constants.singleton.contactNo = ""
        
        let viewController: UIViewController
        viewController = Constants.Storyboards.main.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(viewController, animated: true)

    }
    
    @IBAction func settingsSideMenuOptionClicked(_ sender: UITapGestureRecognizer) {
                
        let viewController = Constants.Storyboards.main.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func plansBtnClicked(_ sender: UITapGestureRecognizer) {
        
        let viewController = Constants.Storyboards.main.instantiateViewController(withIdentifier: "PlansViewController") as! PlansViewController
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}

extension DashboardVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.promotionCollectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! PromotionsCollectionViewCell
        cell.image.image = UIImage.init(named: promotionArray[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:promotionCollectionView.frame.width , height: promotionCollectionView.frame.height)
    }
}
