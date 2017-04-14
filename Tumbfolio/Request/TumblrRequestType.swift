//
//  TumblrRequestType.swift
//  Tumbfolio
//
//  Created by 松下慶大 on 2017/04/12.
//  Copyright © 2017年 matsushita keita. All rights reserved.
//

import Foundation
import APIKit
import Himotoki

protocol TumblrRequestType: Request { }

extension TumblrRequestType {
    var baseURL: URL {
        return URL(string: "http://api.tumblr.com/v2")!
    }
}

extension TumblrRequestType where Response: Decodable {
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        return try decodeValue(object, rootKeyPath: "response")
    }
}
