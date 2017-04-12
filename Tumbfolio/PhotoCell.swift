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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.designCheckView()
        checkView.backgroundColor = UIColor.clear
    }
    
    func fillWith(photo: CandidatePhoto) {
        if (photo.selected) {
            checkView.backgroundColor = UIColor.white
        } else {
            checkView.backgroundColor = UIColor.clear
        }
    }
    
    func tapCell(photo: CandidatePhoto) {
        if (photo.selected) {
            checkView.backgroundColor = UIColor.clear
            photo.changeSelect()
        } else {
            checkView.backgroundColor = UIColor.white
            photo.changeSelect()
        }
    }

    private func designCheckView() {
        self.checkView.layer.cornerRadius = self.checkView.frame.width / 2
        self.checkView.layer.masksToBounds = true
    }
    
}
