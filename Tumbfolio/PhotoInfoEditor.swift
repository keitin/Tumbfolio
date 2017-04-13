//
//  PhotoInfoEditor.swift
//  Tumbfolio
//
//  Created by 松下慶大 on 2017/04/12.
//  Copyright © 2017年 matsushita keita. All rights reserved.
//

import UIKit

class PhotoInfoEditor: UIView {

    var id: Int!
    
    static func makeInstance() -> PhotoInfoEditor {
        let xib = UINib(nibName: "PhotoInfoEditor", bundle: nil)
        let view = xib.instantiate(withOwner: self, options: nil).first as! PhotoInfoEditor
        return view
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
