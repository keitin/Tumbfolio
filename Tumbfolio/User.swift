//
//  User.swift
//  Tumbfolio
//
//  Created by 松下慶大 on 2017/04/13.
//  Copyright © 2017年 matsushita keita. All rights reserved.
//

import Foundation
import Himotoki

struct User: Decodable {
    
    var name: String
    var title: String
    var description: String
    var posts: [Post]
    
    static func decode(_ e: Extractor) throws -> User {
        return try User(
            name: e <| ["blog", "name"],
            title: e <| ["blog", "title"],
            description: e <| ["blog", "description"],
            posts: e <|| ["posts"])
    }
    
    func avatarURL() -> URL {
        return URL(string: "https://api.tumblr.com/v2/blog/\(name)/avatar/128")!
    }
    
}
