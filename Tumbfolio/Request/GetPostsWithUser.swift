//
//  GetPostsWithUser.swift
//  Tumbfolio
//
//  Created by 松下慶大 on 2017/04/12.
//  Copyright © 2017年 matsushita keita. All rights reserved.
//

import Foundation
import APIKit
import Himotoki

struct GetPostsWithUser: TumblrRequestType {
    
    typealias Response = User

    let userDomain: String
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        return "/blog/\(userDomain)/posts"
    }
    
    var queryParameters: [String : Any]? {
        return [
            "api_key": API.KEY
        ]
    }    
}


