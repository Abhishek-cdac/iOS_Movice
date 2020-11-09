//
//  SearchViewController.swift
//  SelfCare
//
//  Created by Sagar Ranshur on 20/05/20.
//  Copyright © 2020 Sagar Ranshur. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var emptyCircleView: UIView!
    @IBOutlet weak var emptyBaseView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setUpView()
    }
    
    func setUpView() {
        emptyCircleView.layer.cornerRadius = emptyCircleView.frame.width / 2
        emptyCircleView.layer.masksToBounds = true
        
        emptyBaseView.layer.cornerRadius = 4.0
        emptyBaseView.elevate(elevation: 2.0)
    }

    @IBAction func closeBtnClicked(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}
