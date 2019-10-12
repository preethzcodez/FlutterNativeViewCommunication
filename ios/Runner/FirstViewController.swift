//
//  FirstViewController.swift
//  Runner
//
//  Created by Preeth on 11/10/19.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var sendSuccess: UIButton!
    @IBOutlet weak var switchView: UIButton!
    @IBOutlet weak var sendError: UIButton!
    @IBOutlet weak var flutterMessage: UILabel!
    
    var argsMessage = String()
    var results : FlutterResult?
    var myNav : UINavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        flutterMessage.text = argsMessage
    }
    
    @IBAction func sendErrorClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
        self.results!(FlutterError(code: "ERROR",
                                   message: "ERROR MESSAGE : FIRST VIEW",
                                   details: nil))
    }
    
    @IBAction func switchViewClick(_ sender: Any) {
        // Push Second View Controller
        self.navigationController?.popViewController(animated: false)
        let viewToPush = SecondViewController()
        viewToPush.argsMessage = self.argsMessage
        viewToPush.results = self.results
        viewToPush.myNav = self.myNav
        myNav?.pushViewController(viewToPush, animated: false)
    }
    
    @IBAction func successClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
        self.results!("SUCCESS MESSAGE : FIRST VIEW")
    }
}
