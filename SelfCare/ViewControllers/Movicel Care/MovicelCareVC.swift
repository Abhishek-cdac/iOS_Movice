//
//  MovicelCareVC.swift
//  SelfCare
//
//  Created by Sagar Ranshur on 18/05/20.
//  Copyright © 2020 Sagar Ranshur. All rights reserved.
//

import UIKit

class MovicelCareVC: UIViewController {

    @IBOutlet weak var backBtnImage: UIImageView!
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var mobileNoText: UILabel!
    
    @IBOutlet weak var movicelCareCollectionView: UICollectionView!
    
    struct MovicelCareData {
        var title: String = ""
        var image: String = ""
        var backgroundColor: String = ""
    }
    
    var dataArray = [MovicelCareData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpData()
    }
    
    func setUpData() {
        dataArray = [ MovicelCareData.init(title: "FAQ".localised(), image: "FAQ",backgroundColor: "ECEA00"),
                      MovicelCareData.init(title: "How to Videos".localised(), image: "video",backgroundColor: "00DEFE"),
                      MovicelCareData.init(title: "Troubleshoot".localised(), image: "troubleshoot",backgroundColor: "6B70F3"),
                      MovicelCareData.init(title: "Helpful Tips".localised(), image: "info",backgroundColor: "FF9E00"),
                      MovicelCareData.init(title: "Live Chat".localised(), image: "chat",backgroundColor: "00A900"),
                      MovicelCareData.init(title: "Track Request".localised(), image: "trackrequest",backgroundColor: "FF5C00"),
                      MovicelCareData.init(title: "Track Order".localised(), image: "share",backgroundColor: "FEC500"),
                      MovicelCareData.init(title: "Locate us".localised(), image: "locateus",backgroundColor: "00ABD8")
        ]
        mobileNoText.text = Constants.singleton.contactNo
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        //manage tap bar
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

        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction func backBtnClicked(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

extension MovicelCareVC: UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = movicelCareCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MovicelCareOptionsCollectionCell
        
        let careObject = dataArray[indexPath.row]
        cell.optionLabel.text = careObject.title
        cell.innerBaseView.backgroundColor = UIColor.init(hexString: careObject.backgroundColor)
        cell.innerImage.image = UIImage.init(named: careObject.image)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let careObject = dataArray[indexPath.row]
        if careObject.title == "FAQ".localised() {
            let faqVC = Constants.Storyboards.main.instantiateViewController(identifier: "MovicelCareFAQDetailsVC") as! MovicelCareFAQDetailsVC
            navigationController?.pushViewController(faqVC, animated: true)
        }else if careObject.title == "Troubleshoot".localised() {
            let troubleshootVC = Constants.Storyboards.main.instantiateViewController(identifier: "TroubleShootVC") as! TroubleShootVC
            navigationController?.pushViewController(troubleshootVC, animated: true)
        }else if careObject.title == "Locate us".localised() {
            let locateusVC = Constants.Storyboards.main.instantiateViewController(identifier: "MovicelCareLocateUsVC") as! MovicelCareLocateUsVC
            navigationController?.pushViewController(locateusVC, animated: true)
        }else if careObject.title == "Live Chat".localised() {
            let locateusVC = Constants.Storyboards.main.instantiateViewController(identifier: "ChatViewController") as! ChatViewController
            navigationController?.pushViewController(locateusVC, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize.init(width: (movicelCareCollectionView.frame.width / 3) - 8, height: ( movicelCareCollectionView.frame.width / 3) - 8)
    }
    
}
