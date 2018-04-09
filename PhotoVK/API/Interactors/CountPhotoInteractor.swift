//
//  CountPhotoInteractor.swift
//  PhotoVK
//
//  Created by Pavel Grechikhin on 07.04.2018.
//  Copyright © 2018 Pavel Grechikhin. All rights reserved.
//

import Foundation
import Magics

class CountPhotoInteractor: MagicsInteractor {
    
    var relativeURL: String = ""
    
    init(id: Int) {
        relativeURL = "photos.getAll?owner_id=\(id)&access_token=\(VKApi.shared.tokenVK)&v=5.74"
    }
    var count = 0
    
    
    func process(json: MagicsJSON, response: URLResponse?, api: MagicsAPI) {
        count = json["response"]["count"].int!
    }
}
