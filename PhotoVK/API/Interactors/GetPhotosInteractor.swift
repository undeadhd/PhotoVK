//
//  GetPhotosInteractor.swift
//  PhotoVK
//
//  Created by Pavel Grechikhin on 07.04.2018.
//  Copyright © 2018 Pavel Grechikhin. All rights reserved.
//

import Foundation
import Magics

class GetPhotosInteractor: MagicsInteractor {
    var relativeURL: String = ""
    
    var photos = [GetPhotosModel()]
    
    init(id: Int, count: Int) {
        relativeURL = "photos.getAll?owner_id=\(id)&count=\(count)&access_token=\(VKApi.shared.tokenVK)&v=5.74"
    }
    
    func process(json: MagicsJSON, response: URLResponse?, api: MagicsAPI) {
        photos = api.arrayFrom(json: json["response"]["items"])
    }
    
}

class GetPhotosModel: NSObject, MagicsModel {
    override required init() {}
    
    @objc var photo_130 = ""
    @objc var photo_604 = ""
}
