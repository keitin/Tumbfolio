//
//  SignInViewController.swift
//  Tumbfolio
//
//  Created by 松下慶大 on 2017/04/12.
//  Copyright © 2017年 matsushita keita. All rights reserved.
//

import UIKit
import APIKit

final class SignInViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    
    static func makeInstance() -> SignInViewController {
        let storyboard = UIStoryboard(name: "SignIn", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! SignInViewController
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        let request = GetPostsWithUser(userDomain: "kinopontas")
        Session.send(request) { result in
            switch result {
            case .success(let user):
                print(user)
            case .failure(let error):
                print(error)
            }
        }
        */
        
    }

    @IBAction func tapStartButton(_ sender: UIButton) {
        
        let profileNC = ProfileNavigationController.makeInstance()
        UIApplication.shared.keyWindow?.rootViewController = profileNC
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
