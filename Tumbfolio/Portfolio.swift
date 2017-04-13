//
//  Portfolio.swift
//  Tumbfolio
//
//  Created by 松下慶大 on 2017/04/13.
//  Copyright © 2017年 matsushita keita. All rights reserved.
//

import Foundation

final class CurrentPortfolio {
    private init() {}
    
    static let sharedInstance = CurrentPortfolio()
    
    var portfolio: Portfolio?

}

final class Portfolio {
    
    var products: [Product] = []
    var numberOfProducts: Int {
        return products.count
    }
    
    init() {}
    
    init(editors: [PhotoInfoEditor]) {
        for editor in editors {
            print(editor.title)
            print(editor.summary)
            let product = Product(
                title: editor.title,
                summary: editor.summary,
                imageURL: editor.imageURL)
            products.append(product)
        }
    }
    
    
}

final class Product {
    
    var title: String
    var summary: String
    var imageURL: String
    
    init(title: String, summary: String, imageURL: String) {
        self.title = title
        self.summary = summary
        self.imageURL = imageURL
    }
    
    func getImageURL() -> URL {
        return URL(string: imageURL)!
    }
    
}
