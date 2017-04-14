//
//  ShowPortfolioCell.swift
//  Tumbfolio
//
//  Created by 松下慶大 on 2017/04/13.
//  Copyright © 2017年 matsushita keita. All rights reserved.
//

import UIKit

final class ShowPortfolioCell: UITableViewCell {

    @IBOutlet weak var outlineView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        designOutlineView()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func designOutlineView() {
        outlineView.layer.cornerRadius = 10
        outlineView.layer.borderColor = UIColor.white.cgColor
        outlineView.layer.borderWidth = 5
        outlineView.backgroundColor = UIColor.clear
        outlineView.alpha = 0.8
    }
    
}
