//
//  Photo.swift
//  Tumbfolio
//
//  Created by 松下慶大 on 2017/04/13.
//  Copyright © 2017年 matsushita keita. All rights reserved.
//

import Foundation
import Himotoki

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
