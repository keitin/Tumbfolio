//
//  ProfileViewController.swift
//  Tumbfolio
//
//  Created by 松下慶大 on 2017/04/12.
//  Copyright © 2017年 matsushita keita. All rights reserved.
//

import UIKit

final class ProfileViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // MARK: Add Naviagation Items
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "NEW", style: .plain, target: self, action: #selector(ProfileViewController.tapNewButton(sender:)))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: Navigation Item Actions
    func tapNewButton(sender: UIBarButtonItem) {
        
        let newPortfolioNavationController = NewPortfolioNavigationController.makeInstance()
        present(newPortfolioNavationController, animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
