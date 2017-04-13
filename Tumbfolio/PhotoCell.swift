//
//  PhotoCell.swift
//  Tumbfolio
//
//  Created by 松下慶大 on 2017/04/12.
//  Copyright © 2017年 matsushita keita. All rights reserved.
//

import UIKit
import SDWebImage

class PhotoCell: UICollectionViewCell {
    
    @IBOutlet weak var checkView: UIView!
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.designCheckView()
        checkView.backgroundColor = UIColor.clear
    }
    
    func fillWith(candidatePost: CandidatePost) {
        photoImageView.sd_setImage(with: candidatePost.post.firstPhotoURL())
        if (candidatePost.selected) {
            checkView.backgroundColor = UIColor.blue
        } else {
            checkView.backgroundColor = UIColor.clear
        }
    }
    
    func tapCell(candidatePost: CandidatePost) {
        if (candidatePost.selected) {
            checkView.backgroundColor = UIColor.clear
            candidatePost.changeSelect()
        } else {
            checkView.backgroundColor = UIColor.blue
            candidatePost.changeSelect()
        }
    }

    private func designCheckView() {
        self.checkView.layer.cornerRadius = self.checkView.frame.width / 2
        self.checkView.layer.masksToBounds = true
        self.checkView.layer.borderColor = UIColor.white.cgColor
        self.checkView.layer.borderWidth = 2
    }
}
