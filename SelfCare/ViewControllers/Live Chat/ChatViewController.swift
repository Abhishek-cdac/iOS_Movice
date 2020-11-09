//
//  ChatViewController.swift
//  SelfCare
//
//  Created by Govind on 20/05/20.
//  Copyright © 2020 Sagar Ranshur. All rights reserved.
//

import UIKit
import WebKit

class ChatViewController: UIViewController , WKUIDelegate{
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadChatView()
    }
    
    func loadChatView(){
        let url = "https://widget.tiledesk.com/v4/index.html?tiledesk_projectid=5ec4cd2913400f0012c2bf7c&tiledesk_isopen=true&tiledesk_fullscreenMode=true&tiledesk_hideHeaderCloseButton=true"
        guard let myURL = URL(string:url) else { return }
        let myRequest = URLRequest(url: myURL)
        webView.load(myRequest)
    }
    
}
