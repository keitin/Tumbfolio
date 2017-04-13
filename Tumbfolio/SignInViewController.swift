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
    @IBOutlet weak var startButton: UIButton!
    
    static func makeInstance() -> SignInViewController {
        let storyboard = UIStoryboard(name: "SignIn", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! SignInViewController
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        designButton()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(SignInViewController.tapScreen(sender:)))
        view.addGestureRecognizer(tapGesture)
        
    }
    
    func tapScreen(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }

    @IBAction func tapStartButton(_ sender: UIButton) {
        
        let request = GetPostsWithUser(userDomain: "kinopontas")
        Session.send(request) { result in
            switch result {
            case .success(let user):
                
                let current = CurrentUser.sharedInstance
                current.user = user
                
                let profileNC = ProfileNavigationController.makeInstance()
                UIApplication.shared.keyWindow?.rootViewController = profileNC
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func designButton() {
        startButton.layer.cornerRadius = 3
    }
    
}
