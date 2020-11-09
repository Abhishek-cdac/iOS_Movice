//
//  PlansViewController.swift
//  SelfCare
//
//  Created by Sagar Ranshur on 22/05/20.
//  Copyright © 2020 Sagar Ranshur. All rights reserved.
//

import UIKit

class PlansViewController: UIViewController {

    @IBOutlet weak var plansTableView: UITableView!
    
    struct ExpandableObject {
        var isExpanded: Bool
        let names: [String]
        let title: String

    }

    var twoDimentionalArray = [
        ExpandableObject(isExpanded: true, names: ["Base Tariff".localised(), "International Tariff".localised()],title: "Tariff".localised()),
        ExpandableObject(isExpanded: true, names: ["Takuia", "Kargas", "Additives(Voice and SMS)"],title: "Plans and Additives"),
        ExpandableObject(isExpanded: true, names: ["Movinet Packages", "Additives(Data)"],title: "Internet"),
    ]
    
    var showIndexPaths = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backBtnClicked(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

extension PlansViewController: UITableViewDelegate,UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return twoDimentionalArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if !twoDimentionalArray[section].isExpanded {
            return 0
        }
        
        return twoDimentionalArray[section].names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = plansTableView.dequeueReusableCell(withIdentifier: "cell")!
        
        cell.textLabel?.text = twoDimentionalArray[indexPath.section].names[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let button = UIButton.init(type: .system)
        
        let title = "  " + twoDimentionalArray[section].title
        
        button.setTitle(title, for: .normal)
        button.contentHorizontalAlignment = .left
        button.tintColor = .white
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.backgroundColor = UIColor.init(hexString: Constants.HexColors.activeColor)
        button.addTarget(self, action: #selector(handleExpandAction), for: .touchUpInside)
        
        button.tag = section
        
        return button
    }
    
    
    @objc func handleExpandAction(button: UIButton) {
        
        
        let section = button.tag
        
        //we'll try to close the section first by deleteing rows
        var indexPaths = [IndexPath]()
        
        for row in twoDimentionalArray[section].names.indices {
            print(0, row)
            
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
        }
        
        let isExpanded = twoDimentionalArray[section].isExpanded
        twoDimentionalArray[section].isExpanded = !isExpanded
                
        if !isExpanded {
            plansTableView.insertRows(at: indexPaths, with: .fade)
        }else {
            plansTableView.deleteRows(at: indexPaths, with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let rechargeListVC = Constants.Storyboards.main.instantiateViewController(identifier: "RechargeListViewController") as! RechargeListViewController
        navigationController?.pushViewController(rechargeListVC, animated: true
        )
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
}


