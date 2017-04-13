//
//  NewPortfolioNavigationController.swift
//  Tumbfolio
//
//  Created by 松下慶大 on 2017/04/12.
//  Copyright © 2017年 matsushita keita. All rights reserved.
//

import UIKit

final class NewPortfolioNavigationController: UINavigationController {

    static func makeInstance() -> NewPortfolioNavigationController {
        let storyboard = UIStoryboard(name: "NewPortfolio", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! NewPortfolioNavigationController
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
