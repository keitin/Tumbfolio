//
//  PortfolioView.swift
//  Tumbfolio
//
//  Created by 松下慶大 on 2017/04/13.
//  Copyright © 2017年 matsushita keita. All rights reserved.
//

import UIKit
import SDWebImage

final class PortfolioView: UIView {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var summaryTextView: UITextView!
    @IBOutlet weak var nameLabel: UILabel!

    static func makeInstance() -> PortfolioView {
        let xib = UINib(nibName: "PortfolioView", bundle: nil)
        let view = xib.instantiate(withOwner: self, options: nil).first as! PortfolioView
        return view
    }
    
    func fillWith(product: Product) {
        self.photoImageView.sd_setImage(with: product.getImageURL())
        self.titleLabel.text = product.title
        self.summaryTextView.text = product.summary
        self.nameLabel.text = CurrentUser.sharedInstance.user.name
    }
    
    func draw(rect: CGRect, position: Int) {
        self.frame.size = CGSize(width: rect.width, height: rect.height)
        self.frame.origin.x = CGFloat(position) * rect.width
        self.frame.origin.y = 0
    }
    
    override func draw(_ rect: CGRect) {
        summaryTextView.font = UIFont(name: "HirakakuProN-W3", size: 12)
    }

}
