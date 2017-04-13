//
//  PhotoInfoEditor.swift
//  Tumbfolio
//
//  Created by 松下慶大 on 2017/04/12.
//  Copyright © 2017年 matsushita keita. All rights reserved.
//

import UIKit
import SDWebImage

class PhotoInfoEditor: UIView {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var summaryTextView: UITextView!
    @IBOutlet weak var photoImageView: UIImageView!

    var id: Int!
    
    static func makeInstance() -> PhotoInfoEditor {
        let xib = UINib(nibName: "PhotoInfoEditor", bundle: nil)
        let view = xib.instantiate(withOwner: self, options: nil).first as! PhotoInfoEditor
        return view
    }
    
    func draw(rect: CGRect, position: Int) {
        self.frame.size = CGSize(width: rect.width, height: rect.height)
        self.frame.origin.x = CGFloat(position) * rect.width
        self.frame.origin.y = 0
        self.id = position
    }
    
    func fillWith(post: Post) {
        self.summaryTextView.text = post.summary
        self.photoImageView.sd_setImage(with: post.firstPhotoURL())
    }

}
