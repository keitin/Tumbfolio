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
    let closeButton = UIButton()
    
    static func makeInstance() -> PortfolioViewController {
        let storyboard = UIStoryboard(name: "Portfolio", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! PortfolioViewController
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addSubviewsPortfolioViews()
        makeCloseLabel()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(PortfolioViewController.tapScreen(sender:)))
        view.addGestureRecognizer(tapGesture)
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
    
    func tapCloseButton(sender: UIButton) {
        dismiss(animated: true)
    }
    
    func tapScreen(sender: UITapGestureRecognizer) {
        closeButton.isHidden = false
        if (closeButton.isSelected) {
            closeButton.frame.origin = CGPoint(x: 10, y: -40)
            closeButton.isSelected = false
        } else {
            UIView.animate(withDuration: 0.3) {
                self.closeButton.frame.origin = CGPoint(x: 10, y: 10)
            }
            closeButton.isSelected = true
        }
        
    }
    
    private func makeCloseLabel() {
        closeButton.frame.size = CGSize(width: 100, height: 40)
        closeButton.frame.origin = CGPoint(x: 10, y: -40)
        closeButton.setTitle("close", for: .normal)
        closeButton.backgroundColor = UIColor(white: 0, alpha: 0.5)
        closeButton.layer.cornerRadius = 5
        closeButton.isSelected = false
        closeButton.isHidden = true
        closeButton.addTarget(self, action: #selector(PortfolioViewController.tapCloseButton(sender:)), for: .touchUpInside)
        view.addSubview(closeButton)
    }

}
