//
//  ProfileCell.swift
//  Tumbfolio
//
//  Created by 松下慶大 on 2017/04/13.
//  Copyright © 2017年 matsushita keita. All rights reserved.
//

import UIKit
import SDWebImage

final class ProfileCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderWidth = 5
        self.layer.borderColor = UIColor(white: 0.9, alpha: 0.9).cgColor
        self.designAvatar()
    }
    
    func fillWith(user: User) {
        self.titleLabel.text = user.title
        self.nameLabel.text = user.name
        self.descriptionLabel.text = user.description
        self.avatarImageView.sd_setImage(with: user.avatarURL())
    }
    
    private func designAvatar() {
        self.avatarImageView.layer.cornerRadius = avatarImageView.frame.width / 2
        self.avatarImageView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
