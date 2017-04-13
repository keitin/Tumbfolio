//
//  CurrentUser.swift
//  Tumbfolio
//
//  Created by 松下慶大 on 2017/04/13.
//  Copyright © 2017年 matsushita keita. All rights reserved.
//

import Foundation

final class CurrentUser {
    
    private init() {}
    
    static let sharedInstance = CurrentUser()
    
    var user: User!
}
