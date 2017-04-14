//
//  Post.swift
//  Tumbfolio
//
//  Created by 松下慶大 on 2017/04/13.
//  Copyright © 2017年 matsushita keita. All rights reserved.
//

import Foundation
import Himotoki

struct Post: Decodable {
    
    var summary: String
    var photos: [Photo]
    
    static func decode(_ e: Extractor) throws -> Post {
        return try Post(
            summary: e <| ["summary"],
            photos: e <|| ["photos"])
    }
    
    func firstPhotoURL() -> URL {
        return URL(string: photos.first!.imageURL)!
    }
}
