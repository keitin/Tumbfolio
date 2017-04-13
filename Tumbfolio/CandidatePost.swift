//
//  CandidatePhoto.swift
//  Tumbfolio
//
//  Created by 松下慶大 on 2017/04/12.
//  Copyright © 2017年 matsushita keita. All rights reserved.
//

import Foundation

final class CandidatePost {
    
    var post: Post
    var selected: Bool
    
    static func trans(posts: [Post]) -> [CandidatePost] {
        var array: [CandidatePost] = []
        for post in posts {
            let candidatePost = CandidatePost(post: post)
            array.append(candidatePost)
        }
        return array
    }
    
    init(post: Post) {
        self.post = post
        self.selected = false
    }
    
    func changeSelect() {
        if (self.selected) {
            self.selected = false
        } else {
            self.selected = true
        }
    }
    
}
