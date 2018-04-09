//
//  CollectionCollectionState.swift
//  Tetrapak
//
//  Created by mapmelad on 03/04/2018.
//  Copyright © 2018 Anvics. All rights reserved.
//

import Foundation
import Amber

struct FriendPhotosCollectionState: AmberState {
    var description: String { return "" }
    
    var userId = 0
    var photos = [GetPhotosModel()]
    
    init(data: Int) {
        userId = data
    }
}
