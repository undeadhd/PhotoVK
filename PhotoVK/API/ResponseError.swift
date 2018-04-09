//
//  ResponseError.swift
//  PhotoVK
//
//  Created by Pavel Grechikhin on 07.04.2018.
//  Copyright © 2018 Pavel Grechikhin. All rights reserved.
//

import Foundation

struct ResponseError: Error {
    let code: String
    let message: String
    
    var isInvalidToken: Bool{
        return code == "error"
    }
    
    init(code: String, message: String) {
        self.code = code
        self.message = message
    }
    
}
