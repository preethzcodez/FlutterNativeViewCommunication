//
//  SecondViewController.swift
//  Runner
//
//  Created by Preeth on 11/10/19.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var sendSuccess: UIButton!
    @IBOutlet weak var sendError: UIButton!
    @IBOutlet weak var secondViewLabel: UILabel!
    @IBOutlet weak var switchView: UIButton!
    
    var results : FlutterResult?
    var myNav : UINavigationController?
    
    var argsMessage = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sendErrorClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
        self.results!(FlutterError(code: "ERROR",
                                   message: "ERROR MESSAGE : SECOND VIEW",
                                   details: nil))
    }
    
    @IBAction func switchViewClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
        let viewToPush = FirstViewController()
        viewToPush.results = self.results
        viewToPush.argsMessage = argsMessage
        viewToPush.myNav = self.myNav
        myNav?.pushViewController(viewToPush, animated: false)
    }
    
    @IBAction func successClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
        self.results!("SUCCESS MESSAGE : SECOND VIEW")
    }
}
