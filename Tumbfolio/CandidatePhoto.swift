//
//  CandidatePhoto.swift
//  Tumbfolio
//
//  Created by 松下慶大 on 2017/04/12.
//  Copyright © 2017年 matsushita keita. All rights reserved.
//

import Foundation

class CandidatePhoto {
    
//    var photo: Photo
    var selected: Bool

    init(photo: Photo) {
//        self.photo = photo
        self.selected = false
    }
    
    init(photo: Photo, selected: Bool) {
//        self.photo = photo
        self.selected = selected
    }
    
    init(selected: Bool) {
        self.selected = selected
    }
    
    func changeSelect() {
        if (self.selected) {
            self.selected = false
        } else {
            self.selected = true
        }
    }
    
}
