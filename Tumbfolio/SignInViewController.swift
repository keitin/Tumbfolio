//
//  SignInViewController.swift
//  Tumbfolio
//
//  Created by 松下慶大 on 2017/04/12.
//  Copyright © 2017年 matsushita keita. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    
    static func makeInstance() -> SignInViewController {
        let storyboard = UIStoryboard(name: "SignIn", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! SignInViewController
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func tapStartButton(_ sender: UIButton) {
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
