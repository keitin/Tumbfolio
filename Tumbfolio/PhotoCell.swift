//
//  PhotoCell.swift
//  Tumbfolio
//
//  Created by 松下慶大 on 2017/04/12.
//  Copyright © 2017年 matsushita keita. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    @IBOutlet weak var checkView: UIView!
    @IBOutlet weak var photoImageView: UIImageView!
    var checked: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.designCheckView()
        checkView.backgroundColor = UIColor.clear
    }
    
    func tapCell() {
        if (checked) {
            checkView.backgroundColor = UIColor.clear
            checked = false
        } else {
            checkView.backgroundColor = UIColor.white
            checked = true
        }
    }

    private func designCheckView() {
        self.checkView.layer.cornerRadius = self.checkView.frame.width / 2
        self.checkView.layer.masksToBounds = true
    }
    
}
