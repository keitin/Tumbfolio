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
    
    typealias Response = [Post]

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
    
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> [Post] {
        return try decodeArray(object, rootKeyPath: ["response", "posts"])
    }
    
}

struct Post: Decodable {
    
    var summary: String
    var photos: [Photo]
    
    static func decode(_ e: Extractor) throws -> Post {
        return try Post(
            summary: e <| ["summary"],
            photos: e <|| ["photos"])
    }
}

struct Photo: Decodable {
    
    var imageURL: String
    var width: Int
    var height: Int
    
    static func decode(_ e: Extractor) throws -> Photo {
        return try Photo(
            imageURL: e <| ["original_size", "url"],
            width: e <| ["original_size", "width"],
            height: e <| ["original_size", "height"])
    }
    
}
