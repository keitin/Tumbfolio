//
//  PortfolioViewController.swift
//  Tumbfolio
//
//  Created by 松下慶大 on 2017/04/13.
//  Copyright © 2017年 matsushita keita. All rights reserved.
//

import UIKit

class PortfolioViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!

    let portfolio = CurrentPortfolio.sharedInstance.portfolio!
    var portfolioViews: [PortfolioView] = []
    
    static func makeInstance() -> PortfolioViewController {
        let storyboard = UIStoryboard(name: "Portfolio", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! PortfolioViewController
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addSubviewsPortfolioViews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.layoutScrollView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func addSubviewsPortfolioViews() {
        for index in 0...(portfolio.numberOfProducts - 1) {
            let portfolioView = PortfolioView.makeInstance()
            portfolioView.fillWith(product: portfolio.products[index])
            portfolioViews.append(portfolioView)
            scrollView.addSubview(portfolioView)
        }
    }
    
    private func layoutScrollView() {
        let width = view.frame.width * CGFloat(portfolio.numberOfProducts)
        let height = view.frame.height
        scrollView.contentSize = CGSize(width: width, height: height)
        
        for index in 0...(portfolio.numberOfProducts - 1) {
            let portfolioView = portfolioViews[index]
            portfolioView.draw(rect: scrollView.frame, position: index)
        }
        
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
