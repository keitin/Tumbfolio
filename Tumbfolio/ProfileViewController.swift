//
//  ProfileViewController.swift
//  Tumbfolio
//
//  Created by 松下慶大 on 2017/04/12.
//  Copyright © 2017年 matsushita keita. All rights reserved.
//

import UIKit

final class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private enum CellType: Int {
        case profile = 0
        case open
    }
    
    @IBOutlet weak var tableView: UITableView!
    let currentUser = CurrentUser.sharedInstance.user!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.register(UINib(nibName: "ProfileCell", bundle: nil), forCellReuseIdentifier: "ProfileCell")
        self.tableView.register(UINib(nibName: "ShowPortfolioCell", bundle: nil), forCellReuseIdentifier: "ShowPortfolioCell")
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // MARK: Add Naviagation Items
        tableView.reloadData()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "NEW", style: .plain, target: self, action: #selector(ProfileViewController.tapNewButton(sender:)))
    }
    
    // MARK: Navigation Item Actions
    func tapNewButton(sender: UIBarButtonItem) {
        
        let newPortfolioNavationController = NewPortfolioNavigationController.makeInstance()
        present(newPortfolioNavationController, animated: true)
        
    }
    
    // MARK: UITableView DataSouce
    func numberOfSections(in tableView: UITableView) -> Int {
        if let _ = CurrentPortfolio.sharedInstance.portfolio {
            return 2
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch CellType.init(rawValue: indexPath.section)! {
        case .profile:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileCell
            cell.fillWith(user: currentUser)
            return cell
        case .open:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ShowPortfolioCell", for: indexPath) as! ShowPortfolioCell
            return cell
        }
    }
    
    // MARK: UITableView Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let _ = CurrentPortfolio.sharedInstance.portfolio else {
            return
        }
        
        if (indexPath.section == 1) {
            let portfolioViewController = PortfolioViewController.makeInstance()
            present(portfolioViewController, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let _ = CurrentPortfolio.sharedInstance.portfolio {
            switch CellType.init(rawValue: indexPath.section)! {
            case .profile:
                return tableView.frame.height - 113
            case .open:
                return 113
            }
        } else {
            return tableView.frame.height - 113
        }   
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
