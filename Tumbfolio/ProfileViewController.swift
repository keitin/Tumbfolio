//
//  ProfileViewController.swift
//  Tumbfolio
//
//  Created by 松下慶大 on 2017/04/12.
//  Copyright © 2017年 matsushita keita. All rights reserved.
//

import UIKit

final class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    let currentUser = CurrentUser.sharedInstance.user!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // MARK: Add Naviagation Items
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "NEW", style: .plain, target: self, action: #selector(ProfileViewController.tapNewButton(sender:)))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.register(UINib(nibName: "ProfileCell", bundle: nil), forCellReuseIdentifier: "ProfileCell")
    }
    
    // MARK: Navigation Item Actions
    func tapNewButton(sender: UIBarButtonItem) {
        
        let newPortfolioNavationController = NewPortfolioNavigationController.makeInstance()
        present(newPortfolioNavationController, animated: true)
        
    }
    
    // MARK: UITableView DataSouce
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileCell
        cell.fillWith(user: currentUser)
        return cell
    }
    
    // MARK: UITableView Delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 265
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
