//
//  VKApi.swift
//  PhotoVK
//
//  Created by Pavel Grechikhin on 07.04.2018.
//  Copyright © 2018 Pavel Grechikhin. All rights reserved.
//

import Foundation
import Magics

class VKApi: MagicsAPI {
    
    static let shared = VKApi()
    
    override var baseURL: String {
        return "https://api.vk.com/method/"
    }
    var tokenVK = ""
    
    override func hasErrorFor<T>(json: MagicsJSON?, response: URLResponse?, error: Error?, interactor: T) -> Error? where T : MagicsInteractor {
        return errorFor(json: json, response: response, error: error)
    }
    
    
    func errorFor(json: MagicsJSON?, response: URLResponse?, error: Error?) -> ResponseError?{
        guard let json = json else {
            return ResponseError(code: "error", message: "Ошибка")
        }
        return nil
    }
    
}
