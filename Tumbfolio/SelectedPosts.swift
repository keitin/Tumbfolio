//
//  File.swift
//  Tumbfolio
//
//  Created by 松下慶大 on 2017/04/13.
//  Copyright © 2017年 matsushita keita. All rights reserved.
//

import Foundation
final class SelectedPosts {
    
    var posts: [Post] = []
    var numberOfPosts: Int {
        return posts.count
    }
    
    init(candidatePosts: [CandidatePost]) {
        for candidatePost in candidatePosts {
            if (candidatePost.selected) {
                posts.append(candidatePost.post)
            }
        }
    }
    
    
}
