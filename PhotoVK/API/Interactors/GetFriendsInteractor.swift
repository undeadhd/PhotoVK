//
//  GetFriendsInteractor.swift
//  PhotoVK
//
//  Created by Pavel Grechikhin on 07.04.2018.
//  Copyright © 2018 Pavel Grechikhin. All rights reserved.
//

import Foundation
import Magics

class GetFriendsInteractor: MagicsInteractor {
    var relativeURL: String = "friends.get?order=name&name_case=nom&fields=first_name, last_name, photo_50&access_token=\(VKApi.shared.tokenVK)&v=5.74"
    
    var respons = [GetFriendsModel()]
    
    func process(json: MagicsJSON, response: URLResponse?, api: MagicsAPI) {
        respons = api.arrayFrom(json: json["response"]["items"])
    }
}


class GetFriendsModel: NSObject, MagicsModel {
    override required init() {}
    
    @objc var id = 0
    @objc var first_name = ""
    @objc var last_name = ""
    @objc var photo_50 = ""
}
