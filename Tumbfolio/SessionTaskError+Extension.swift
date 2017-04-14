//
//  SessionTaskError+Extension.swift
//  Tumbfolio
//
//  Created by 松下慶大 on 2017/04/13.
//  Copyright © 2017年 matsushita keita. All rights reserved.
//

import Foundation
import APIKit

extension SessionTaskError {
    
    func message() -> String {
        switch self {
        case .connectionError(_):
            return "The Internet connection appears to be offline."
        case .requestError(_):
            return "We could not find the user name"
        case .responseError(_):
            return "Request error"
        }
    }
}
